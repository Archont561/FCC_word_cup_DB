--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (48, 2018, 'Final', 67, 68, 4, 2);
INSERT INTO public.games VALUES (49, 2018, 'Third Place', 69, 70, 2, 0);
INSERT INTO public.games VALUES (50, 2018, 'Semi-Final', 68, 70, 2, 1);
INSERT INTO public.games VALUES (51, 2018, 'Semi-Final', 67, 69, 1, 0);
INSERT INTO public.games VALUES (52, 2018, 'Quarter-Final', 68, 71, 3, 2);
INSERT INTO public.games VALUES (53, 2018, 'Quarter-Final', 70, 72, 2, 0);
INSERT INTO public.games VALUES (54, 2018, 'Quarter-Final', 69, 73, 2, 1);
INSERT INTO public.games VALUES (55, 2018, 'Quarter-Final', 67, 74, 2, 0);
INSERT INTO public.games VALUES (56, 2018, 'Eighth-Final', 70, 75, 2, 1);
INSERT INTO public.games VALUES (57, 2018, 'Eighth-Final', 72, 76, 1, 0);
INSERT INTO public.games VALUES (58, 2018, 'Eighth-Final', 69, 77, 3, 2);
INSERT INTO public.games VALUES (59, 2018, 'Eighth-Final', 73, 78, 2, 0);
INSERT INTO public.games VALUES (60, 2018, 'Eighth-Final', 68, 79, 2, 1);
INSERT INTO public.games VALUES (61, 2018, 'Eighth-Final', 71, 80, 2, 1);
INSERT INTO public.games VALUES (62, 2018, 'Eighth-Final', 74, 81, 2, 1);
INSERT INTO public.games VALUES (63, 2018, 'Eighth-Final', 67, 82, 4, 3);
INSERT INTO public.games VALUES (64, 2014, 'Final', 83, 82, 1, 0);
INSERT INTO public.games VALUES (65, 2014, 'Third Place', 84, 73, 3, 0);
INSERT INTO public.games VALUES (66, 2014, 'Semi-Final', 82, 84, 1, 0);
INSERT INTO public.games VALUES (67, 2014, 'Semi-Final', 83, 73, 7, 1);
INSERT INTO public.games VALUES (68, 2014, 'Quarter-Final', 84, 85, 1, 0);
INSERT INTO public.games VALUES (69, 2014, 'Quarter-Final', 82, 69, 1, 0);
INSERT INTO public.games VALUES (70, 2014, 'Quarter-Final', 73, 75, 2, 1);
INSERT INTO public.games VALUES (71, 2014, 'Quarter-Final', 83, 67, 1, 0);
INSERT INTO public.games VALUES (72, 2014, 'Eighth-Final', 73, 86, 2, 1);
INSERT INTO public.games VALUES (73, 2014, 'Eighth-Final', 75, 74, 2, 0);
INSERT INTO public.games VALUES (74, 2014, 'Eighth-Final', 67, 87, 2, 0);
INSERT INTO public.games VALUES (75, 2014, 'Eighth-Final', 83, 88, 2, 1);
INSERT INTO public.games VALUES (76, 2014, 'Eighth-Final', 84, 78, 2, 1);
INSERT INTO public.games VALUES (77, 2014, 'Eighth-Final', 85, 89, 2, 1);
INSERT INTO public.games VALUES (78, 2014, 'Eighth-Final', 82, 76, 1, 0);
INSERT INTO public.games VALUES (79, 2014, 'Eighth-Final', 69, 90, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (67, 'France');
INSERT INTO public.teams VALUES (68, 'Croatia');
INSERT INTO public.teams VALUES (69, 'Belgium');
INSERT INTO public.teams VALUES (70, 'England');
INSERT INTO public.teams VALUES (71, 'Russia');
INSERT INTO public.teams VALUES (72, 'Sweden');
INSERT INTO public.teams VALUES (73, 'Brazil');
INSERT INTO public.teams VALUES (74, 'Uruguay');
INSERT INTO public.teams VALUES (75, 'Colombia');
INSERT INTO public.teams VALUES (76, 'Switzerland');
INSERT INTO public.teams VALUES (77, 'Japan');
INSERT INTO public.teams VALUES (78, 'Mexico');
INSERT INTO public.teams VALUES (79, 'Denmark');
INSERT INTO public.teams VALUES (80, 'Spain');
INSERT INTO public.teams VALUES (81, 'Portugal');
INSERT INTO public.teams VALUES (82, 'Argentina');
INSERT INTO public.teams VALUES (83, 'Germany');
INSERT INTO public.teams VALUES (84, 'Netherlands');
INSERT INTO public.teams VALUES (85, 'Costa Rica');
INSERT INTO public.teams VALUES (86, 'Chile');
INSERT INTO public.teams VALUES (87, 'Nigeria');
INSERT INTO public.teams VALUES (88, 'Algeria');
INSERT INTO public.teams VALUES (89, 'Greece');
INSERT INTO public.teams VALUES (90, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 79, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 90, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--
