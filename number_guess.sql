--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1680661449472', NULL, NULL);
INSERT INTO public.users VALUES (3, 'user_1680661449471', NULL, NULL);
INSERT INTO public.users VALUES (22, 'user_1680666011797', 2, 14);
INSERT INTO public.users VALUES (5, 'user_1680664959518', 2, 487);
INSERT INTO public.users VALUES (4, 'user_1680664959519', 5, 61);
INSERT INTO public.users VALUES (21, 'user_1680666011798', 5, 69);
INSERT INTO public.users VALUES (7, 'user_1680665056593', 2, 212);
INSERT INTO public.users VALUES (6, 'user_1680665056594', 5, 154);
INSERT INTO public.users VALUES (8, 's', NULL, NULL);
INSERT INTO public.users VALUES (24, 'user_1680666023728', 2, 338);
INSERT INTO public.users VALUES (10, 'user_1680665231035', 2, 641);
INSERT INTO public.users VALUES (9, 'user_1680665231036', 4, 165);
INSERT INTO public.users VALUES (23, 'user_1680666023729', 5, 105);
INSERT INTO public.users VALUES (12, 'user_1680665400067', 2, 120);
INSERT INTO public.users VALUES (11, 'user_1680665400068', 5, 282);
INSERT INTO public.users VALUES (1, 'a', 3, 7);
INSERT INTO public.users VALUES (26, 'user_1680666032266', 2, 534);
INSERT INTO public.users VALUES (14, 'user_1680665749523', 2, 172);
INSERT INTO public.users VALUES (13, 'user_1680665749524', 4, 100);
INSERT INTO public.users VALUES (25, 'user_1680666032267', 5, 104);
INSERT INTO public.users VALUES (16, 'user_1680665787499', 2, 539);
INSERT INTO public.users VALUES (15, 'user_1680665787500', 5, 16);
INSERT INTO public.users VALUES (28, 'user_1680666042165', 2, 132);
INSERT INTO public.users VALUES (18, 'user_1680665884819', 2, 9);
INSERT INTO public.users VALUES (17, 'user_1680665884820', 4, 255);
INSERT INTO public.users VALUES (27, 'user_1680666042166', 5, 218);
INSERT INTO public.users VALUES (20, 'user_1680665927796', 2, 521);
INSERT INTO public.users VALUES (19, 'user_1680665927797', 5, 70);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 28, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

