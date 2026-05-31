--
-- PostgreSQL database dump
--

\restrict vjksjwp2cWzymM6bxIBloWUNCwSUjwxMdzQHKHSKXfsEbOs7gj7omyUiVb4ZdPd

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.2

-- Started on 2026-05-31 19:45:26

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS tennis_db;
--
-- TOC entry 5113 (class 1262 OID 16388)
-- Name: tennis_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE tennis_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Europe.1252';


ALTER DATABASE tennis_db OWNER TO postgres;

\unrestrict vjksjwp2cWzymM6bxIBloWUNCwSUjwxMdzQHKHSKXfsEbOs7gj7omyUiVb4ZdPd
\connect tennis_db
\restrict vjksjwp2cWzymM6bxIBloWUNCwSUjwxMdzQHKHSKXfsEbOs7gj7omyUiVb4ZdPd

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 243 (class 1255 OID 16528)
-- Name: add_player(character varying, character varying, integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_player(IN p_first_name character varying, IN p_last_name character varying, IN p_ranking integer, IN p_image_path character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO player(first_name, last_name, ranking, image_path)
    VALUES (p_first_name, p_last_name, p_ranking, p_image_path);
END;
$$;


ALTER PROCEDURE public.add_player(IN p_first_name character varying, IN p_last_name character varying, IN p_ranking integer, IN p_image_path character varying) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 16516)
-- Name: add_player(text, text, integer, text, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_player(IN p_first_name text, IN p_last_name text, IN p_ranking integer, IN p_image_path text, IN p_country_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO player(
        first_name,
        last_name,
        ranking,
        image_path,
        country_id
    )
    VALUES(
              p_first_name,
              p_last_name,
              p_ranking,
              p_image_path,
              p_country_id
          );
END;
$$;


ALTER PROCEDURE public.add_player(IN p_first_name text, IN p_last_name text, IN p_ranking integer, IN p_image_path text, IN p_country_id integer) OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 16518)
-- Name: add_player_to_tournament(integer, integer, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_player_to_tournament(IN p_tournament_id integer, IN p_player_id integer, IN p_result text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO tournament_player(
        tournament_id,
        player_id,
        result
    )
    VALUES(
              p_tournament_id,
              p_player_id,
              p_result
          );
END;
$$;


ALTER PROCEDURE public.add_player_to_tournament(IN p_tournament_id integer, IN p_player_id integer, IN p_result text) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 16554)
-- Name: add_player_to_tournament(bigint, bigint, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_player_to_tournament(IN p_tournament_id bigint, IN p_player_id bigint, IN p_result character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO tournament_player(tournament_id, player_id, result)
    VALUES (p_tournament_id, p_player_id, p_result);
END;
$$;


ALTER PROCEDURE public.add_player_to_tournament(IN p_tournament_id bigint, IN p_player_id bigint, IN p_result character varying) OWNER TO postgres;

--
-- TOC entry 239 (class 1255 OID 16519)
-- Name: add_sponsor_to_tournament(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_sponsor_to_tournament(IN p_tournament_id integer, IN p_sponsor_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO tournament_sponsor(
        tournament_id,
        sponsor_id
    )
    VALUES(
              p_tournament_id,
              p_sponsor_id
          );
END;
$$;


ALTER PROCEDURE public.add_sponsor_to_tournament(IN p_tournament_id integer, IN p_sponsor_id integer) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 16517)
-- Name: add_tournament(text, integer, numeric, text, text, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_tournament(IN p_name text, IN p_founded_year integer, IN p_prize_money numeric, IN p_surface text, IN p_image_path text, IN p_country_id integer, IN p_category_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO tournament(
        name,
        founded_year,
        prize_money,
        surface,
        image_path,
        country_id,
        category_id
    )
    VALUES(
              p_name,
              p_founded_year,
              p_prize_money,
              p_surface,
              p_image_path,
              p_country_id,
              p_category_id
          );
END;
$$;


ALTER PROCEDURE public.add_tournament(IN p_name text, IN p_founded_year integer, IN p_prize_money numeric, IN p_surface text, IN p_image_path text, IN p_country_id integer, IN p_category_id integer) OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 16515)
-- Name: create_admin(text, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_admin(IN p_username text, IN p_password text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO users(username, password, role)
    VALUES(p_username, p_password, 'ADMIN');
END;
$$;


ALTER PROCEDURE public.create_admin(IN p_username text, IN p_password text) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 16530)
-- Name: delete_player(bigint); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.delete_player(IN p_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM player WHERE id = p_id;
END;
$$;


ALTER PROCEDURE public.delete_player(IN p_id bigint) OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 16531)
-- Name: get_players(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_players() RETURNS TABLE(id bigint, first_name character varying, last_name character varying, ranking integer, image_path character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT p.id, p.first_name, p.last_name, p.ranking, p.image_path
        FROM player p;
END;
$$;


ALTER FUNCTION public.get_players() OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 16527)
-- Name: get_tournaments(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_tournaments() RETURNS TABLE(id integer, name character varying, founded_year integer, prize_money numeric, surface character varying, image_path text, country_id integer, category_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN

    RETURN QUERY

        SELECT
            t.id,
            t.name,
            t.founded_year,
            t.prize_money,
            t.surface,
            t.image_path,
            t.country_id,
            t.category_id
        FROM tournament t;

END;
$$;


ALTER FUNCTION public.get_tournaments() OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 16524)
-- Name: login_user(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.login_user(p_username text, p_password text) RETURNS TABLE(id integer, username character varying, password character varying, role character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN

    RETURN QUERY

        SELECT
            u.id,
            u.username,
            u.password,
            u.role
        FROM users u
        WHERE
            u.username = p_username
          AND
            u.password = p_password;

END;
$$;


ALTER FUNCTION public.login_user(p_username text, p_password text) OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 16526)
-- Name: register_user(character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.register_user(IN p_username character varying, IN p_password character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN

    INSERT INTO users(
        username,
        password,
        role
    )
    VALUES(
              p_username,
              p_password,
              'USER'
          );

END;
$$;


ALTER PROCEDURE public.register_user(IN p_username character varying, IN p_password character varying) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 16529)
-- Name: update_player(bigint, character varying, character varying, integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_player(IN p_id bigint, IN p_first_name character varying, IN p_last_name character varying, IN p_ranking integer, IN p_image_path character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE player
    SET first_name = p_first_name,
        last_name = p_last_name,
        ranking = p_ranking,
        image_path = p_image_path
    WHERE id = p_id;
END;
$$;


ALTER PROCEDURE public.update_player(IN p_id bigint, IN p_first_name character varying, IN p_last_name character varying, IN p_ranking integer, IN p_image_path character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16414)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16413)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 223
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 222 (class 1259 OID 16403)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16402)
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_id_seq OWNER TO postgres;

--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 221
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- TOC entry 228 (class 1259 OID 16436)
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    ranking integer,
    image_path text,
    country_id integer
);


ALTER TABLE public.player OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16435)
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.player_id_seq OWNER TO postgres;

--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 227
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


--
-- TOC entry 226 (class 1259 OID 16425)
-- Name: sponsor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sponsor (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.sponsor OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16424)
-- Name: sponsor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sponsor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sponsor_id_seq OWNER TO postgres;

--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 225
-- Name: sponsor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sponsor_id_seq OWNED BY public.sponsor.id;


--
-- TOC entry 230 (class 1259 OID 16453)
-- Name: tournament; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournament (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    founded_year integer,
    prize_money numeric(15,2),
    surface character varying(20),
    image_path text,
    country_id integer,
    category_id integer
);


ALTER TABLE public.tournament OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16452)
-- Name: tournament_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tournament_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tournament_id_seq OWNER TO postgres;

--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 229
-- Name: tournament_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tournament_id_seq OWNED BY public.tournament.id;


--
-- TOC entry 234 (class 1259 OID 16533)
-- Name: tournament_player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournament_player (
    id integer NOT NULL,
    tournament_id integer NOT NULL,
    player_id integer NOT NULL,
    result character varying(100)
);


ALTER TABLE public.tournament_player OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16532)
-- Name: tournament_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tournament_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tournament_player_id_seq OWNER TO postgres;

--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 233
-- Name: tournament_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tournament_player_id_seq OWNED BY public.tournament_player.id;


--
-- TOC entry 232 (class 1259 OID 16496)
-- Name: tournament_sponsor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournament_sponsor (
    id integer NOT NULL,
    tournament_id integer NOT NULL,
    sponsor_id integer NOT NULL
);


ALTER TABLE public.tournament_sponsor OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16495)
-- Name: tournament_sponsor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tournament_sponsor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tournament_sponsor_id_seq OWNER TO postgres;

--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 231
-- Name: tournament_sponsor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tournament_sponsor_id_seq OWNED BY public.tournament_sponsor.id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(20) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4906 (class 2604 OID 16417)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 4905 (class 2604 OID 16406)
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- TOC entry 4908 (class 2604 OID 16439)
-- Name: player id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- TOC entry 4907 (class 2604 OID 16428)
-- Name: sponsor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsor ALTER COLUMN id SET DEFAULT nextval('public.sponsor_id_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 16456)
-- Name: tournament id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament ALTER COLUMN id SET DEFAULT nextval('public.tournament_id_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 16536)
-- Name: tournament_player id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_player ALTER COLUMN id SET DEFAULT nextval('public.tournament_player_id_seq'::regclass);


--
-- TOC entry 4910 (class 2604 OID 16499)
-- Name: tournament_sponsor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_sponsor ALTER COLUMN id SET DEFAULT nextval('public.tournament_sponsor_id_seq'::regclass);


--
-- TOC entry 4904 (class 2604 OID 16393)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5097 (class 0 OID 16414)
-- Dependencies: 224
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
1	Grand Slam
2	Masters 1000
3	ATP 500
4	ATP 250
\.


--
-- TOC entry 5095 (class 0 OID 16403)
-- Dependencies: 222
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name) FROM stdin;
1	Croatia
2	Serbia
3	Spain
4	Italy
\.


--
-- TOC entry 5101 (class 0 OID 16436)
-- Dependencies: 228
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (id, first_name, last_name, ranking, image_path, country_id) FROM stdin;
4	Novak	Djokovic	1	assets/djokovic.png	2
5	Carlos	Alcaraz	2	assets/alcaraz.png	3
9	Test2	Player2	99	test.png	1
\.


--
-- TOC entry 5099 (class 0 OID 16425)
-- Dependencies: 226
-- Data for Name: sponsor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sponsor (id, name) FROM stdin;
1	Nike
2	Rolex
3	Adidas
4	Wilson
\.


--
-- TOC entry 5103 (class 0 OID 16453)
-- Dependencies: 230
-- Data for Name: tournament; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tournament (id, name, founded_year, prize_money, surface, image_path, country_id, category_id) FROM stdin;
1	Wimbledon	1877	50000000.00	GRASS	assets/wimbledon.png	4	1
5	Australian Open	1905	75000000.00	HARD	assets/ao.png	1	1
\.


--
-- TOC entry 5107 (class 0 OID 16533)
-- Dependencies: 234
-- Data for Name: tournament_player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tournament_player (id, tournament_id, player_id, result) FROM stdin;
2	1	4	N/A
3	1	5	N/A
5	5	4	N/A
6	5	5	N/A
\.


--
-- TOC entry 5105 (class 0 OID 16496)
-- Dependencies: 232
-- Data for Name: tournament_sponsor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tournament_sponsor (id, tournament_id, sponsor_id) FROM stdin;
\.


--
-- TOC entry 5093 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, role) FROM stdin;
1	admin	admin123	ADMIN
2	user1	1234	USER
\.


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 223
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 4, true);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 221
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 4, true);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 227
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_id_seq', 10, true);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 225
-- Name: sponsor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sponsor_id_seq', 4, true);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 229
-- Name: tournament_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tournament_id_seq', 9, true);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 233
-- Name: tournament_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tournament_player_id_seq', 7, true);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 231
-- Name: tournament_sponsor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tournament_sponsor_id_seq', 1, false);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4921 (class 2606 OID 16423)
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- TOC entry 4923 (class 2606 OID 16421)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 4917 (class 2606 OID 16412)
-- Name: country country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_name_key UNIQUE (name);


--
-- TOC entry 4919 (class 2606 OID 16410)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 4929 (class 2606 OID 16446)
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- TOC entry 4925 (class 2606 OID 16434)
-- Name: sponsor sponsor_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT sponsor_name_key UNIQUE (name);


--
-- TOC entry 4927 (class 2606 OID 16432)
-- Name: sponsor sponsor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT sponsor_pkey PRIMARY KEY (id);


--
-- TOC entry 4931 (class 2606 OID 16462)
-- Name: tournament tournament_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament
    ADD CONSTRAINT tournament_pkey PRIMARY KEY (id);


--
-- TOC entry 4935 (class 2606 OID 16541)
-- Name: tournament_player tournament_player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_player
    ADD CONSTRAINT tournament_player_pkey PRIMARY KEY (id);


--
-- TOC entry 4937 (class 2606 OID 16543)
-- Name: tournament_player tournament_player_tournament_id_player_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_player
    ADD CONSTRAINT tournament_player_tournament_id_player_id_key UNIQUE (tournament_id, player_id);


--
-- TOC entry 4933 (class 2606 OID 16504)
-- Name: tournament_sponsor tournament_sponsor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_sponsor
    ADD CONSTRAINT tournament_sponsor_pkey PRIMARY KEY (id);


--
-- TOC entry 4913 (class 2606 OID 16399)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4915 (class 2606 OID 16401)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4938 (class 2606 OID 16447)
-- Name: player player_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- TOC entry 4939 (class 2606 OID 16468)
-- Name: tournament tournament_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament
    ADD CONSTRAINT tournament_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 4940 (class 2606 OID 16463)
-- Name: tournament tournament_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament
    ADD CONSTRAINT tournament_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- TOC entry 4943 (class 2606 OID 16549)
-- Name: tournament_player tournament_player_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_player
    ADD CONSTRAINT tournament_player_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) ON DELETE CASCADE;


--
-- TOC entry 4944 (class 2606 OID 16544)
-- Name: tournament_player tournament_player_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_player
    ADD CONSTRAINT tournament_player_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES public.tournament(id) ON DELETE CASCADE;


--
-- TOC entry 4941 (class 2606 OID 16510)
-- Name: tournament_sponsor tournament_sponsor_sponsor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_sponsor
    ADD CONSTRAINT tournament_sponsor_sponsor_id_fkey FOREIGN KEY (sponsor_id) REFERENCES public.sponsor(id) ON DELETE CASCADE;


--
-- TOC entry 4942 (class 2606 OID 16505)
-- Name: tournament_sponsor tournament_sponsor_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_sponsor
    ADD CONSTRAINT tournament_sponsor_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES public.tournament(id) ON DELETE CASCADE;


-- Completed on 2026-05-31 19:45:26

--
-- PostgreSQL database dump complete
--

\unrestrict vjksjwp2cWzymM6bxIBloWUNCwSUjwxMdzQHKHSKXfsEbOs7gj7omyUiVb4ZdPd

