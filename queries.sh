#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

psql_query() {
  echo $($PSQL "$1")
}

echo -e "\nTotal number of goals in all games from winning teams:"
psql_query "SELECT SUM(winner_goals) FROM games;"

echo -e "\nTotal number of goals in all games from both teams combined:"
psql_query "SELECT SUM(winner_goals + opponent_goals) FROM games;"

echo -e "\nAverage number of goals in all games from the winning teams:"
psql_query "SELECT AVG(winner_goals) FROM games;"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
psql_query "SELECT ROUND(AVG(winner_goals), 2) FROM games;"

echo -e "\nAverage number of goals in all games from both teams:"
psql_query "SELECT AVG(winner_goals + opponent_goals) FROM games;"

echo -e "\nMost goals scored in a single game by one team:"
psql_query "SELECT MAX(goals) FROM (SELECT winner_goals AS goals FROM games UNION SELECT opponent_goals FROM games) AS games_goals;" 

echo -e "\nNumber of games where the winning team scored more than two goals:"
psql_query "SELECT COUNT(*) FROM games WHERE winner_goals > 2;"

echo -e "\nWinner of the 2018 tournament team name:"
psql_query "SELECT name FROM teams WHERE team_id = (SELECT winner_id FROM games WHERE year=2018 and round='Final');"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
psql_query "SELECT name, team_id FROM teams WHERE team_id IN ($(psql_query "SELECT winner_id, opponent_id FROM GAMES WHERE round='Eighth-Final' and year=2014;" | sed 's/[| ]/,/g')) ORDER BY name ASC;" | sed -E 's/\|[0-9]+ */\n/g'

echo -e "List of unique winning team names in the whole data set:"
psql_query "SELECT name, team_id FROM teams WHERE team_id IN (SELECT DISTINCT(winner_id) FROM games) ORDER BY name ASC;" | sed -E 's/\|[0-9]+ */\n/g'

echo -e "Year and team name of all the champions:"
psql_query "SELECT g.year, t.name FROM games AS g FULL JOIN teams AS t ON t.team_id = g.winner_id WHERE g.round='Final' ORDER BY g.year ASC;" | sed 's/ /\n/g'

echo -e "\nList of teams that start with 'Co':"
psql_query "SELECT name FROM teams WHERE name LIKE 'Co%';" | sed -E 's/ /\n/'
