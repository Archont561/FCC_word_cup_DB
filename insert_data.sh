#!/bin/bash

if [[ $1 == "test" ]]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
  DB="worldcuptest"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
  DB="worldcup"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.
GAMES_FILE="./games.csv"

psql_query() {
  echo $($PSQL "$1")
}

# Connect to the specified database
psql_query "\c $DB"

# Check if tables exist
tables_exist=$(psql_query "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'teams');")
if [[ $tables_exist == "f" ]]; then
  # Create tables if they don't exist
  psql_query "CREATE TABLE teams(
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
  );"
  psql_query "CREATE TABLE games(
    game_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR(20) NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL,
    FOREIGN KEY (winner_id) REFERENCES teams (team_id),
    FOREIGN KEY (opponent_id) REFERENCES teams (team_id)
  );"
else
  # Truncate tables if they exist
  psql_query "TRUNCATE TABLE teams, games;"
fi

# Read and insert data from games CSV
while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
  if [[ "$YEAR" != "year" && -n "$YEAR" ]]; then
    WINNER_ID=$(psql_query "SELECT team_id FROM teams WHERE name='$WINNER';")
    if [[ -z $WINNER_ID ]]; then
      psql_query "INSERT INTO teams(name) VALUES ('$WINNER');"
      WINNER_ID=$(psql_query "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi
    OPPONENT_ID=$(psql_query "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    if [[ -z $OPPONENT_ID ]]; then
      psql_query "INSERT INTO teams(name) VALUES ('$OPPONENT');"
      OPPONENT_ID=$(psql_query "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    fi
    
    psql_query "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
    VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);"
  fi
done < "$GAMES_FILE"
