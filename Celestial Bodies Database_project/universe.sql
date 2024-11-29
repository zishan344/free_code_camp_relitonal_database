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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100),
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years numeric(12,4),
    number_of_stars integer,
    discovered_by character varying(50),
    distance_from_earth_in_light_years numeric(12,4) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_list; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_list (
    galaxy_list_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_code character varying(10) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.galaxy_list OWNER TO freecodecamp;

--
-- Name: galaxy_list_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_list_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_list_id_seq OWNED BY public.galaxy_list.galaxy_list_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(100),
    moon_type character varying(30) NOT NULL,
    radius_in_km numeric(12,4) NOT NULL,
    orbital_period_in_days numeric(10,4),
    distance_from_planet_in_km numeric(10,4),
    has_water boolean,
    is_habitable boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    description character varying(100),
    planet_type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    distance_from_star_in_au numeric(12,4),
    orbital_period_in_days numeric(12,4),
    radius_in_km integer,
    average_temperature integer,
    atmosphere_composition text,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(100),
    star_type character varying(30) NOT NULL,
    mass_in_solar_masses numeric(10,4),
    luminosity numeric(10,4),
    temperature_in_kelvin integer,
    age_in_million_years numeric(10,4),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_list galaxy_list_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_list ALTER COLUMN galaxy_list_id SET DEFAULT nextval('public.galaxy_list_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', NULL, NULL, NULL, 0.0000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy', 'Spiral', NULL, NULL, NULL, 2537000.0000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest in our Local Group', 'Spiral', NULL, NULL, NULL, 3000000.0000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unusual galaxy with a bright nucleus', 'Lenticular', NULL, NULL, NULL, 29000000.0000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Famous for its interaction with a companion galaxy', 'Spiral', NULL, NULL, NULL, 23000000.0000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Known for its dark band of dust', 'Spiral', NULL, NULL, NULL, 17000000.0000);


--
-- Data for Name: galaxy_list; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_list VALUES (1, 'Milky Way', 'MW001', 'Our home galaxy in the Local Group');
INSERT INTO public.galaxy_list VALUES (2, 'Andromeda', 'AND002', 'Nearest large galaxy to the Milky Way');
INSERT INTO public.galaxy_list VALUES (3, 'Triangulum', 'TRI003', 'Third-largest galaxy in the Local Group');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth’s only natural satellite', 'Natural', 1737.4000, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars’s innermost moon', 'Natural', 11.2667, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars’s outermost moon', 'Natural', 6.2000, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Most geologically active body in the Solar System', 'Natural', 1821.6000, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 'Potential for a subsurface ocean', 'Natural', 1560.8000, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System', 'Natural', 2634.1000, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon of Jupiter', 'Natural', 2410.3000, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', 'Natural', 2574.7000, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn’s moon with active geysers', 'Natural', 252.1000, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Small moon of Saturn with a giant crater', 'Natural', 198.2000, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Triton', 'Largest moon of Neptune', 'Natural', 1353.4000, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Charon', 'Largest moon of Pluto', 'Natural', 606.0000, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Uranus’s outermost large moon', 'Natural', 761.4000, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Brightest moon of Uranus', 'Natural', 578.9000, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 'Saturn’s moon with an icy surface', 'Natural', 561.4000, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, 'Rhea', 'Saturn’s second-largest moon', 'Natural', 763.8000, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (17, 'Iapetus', 'Saturn’s moon with a two-tone surface', 'Natural', 735.6000, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (18, 'Proteus', 'Second-largest moon of Neptune', 'Natural', 210.0000, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Nereid', 'Outer moon of Neptune', 'Natural', 170.0000, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Hyperion', 'Irregular-shaped moon of Saturn', 'Natural', 133.0000, NULL, NULL, NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun', 'Terrestrial', true, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet', 'Terrestrial', false, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Earth’s twin due to its size and mass', 'Terrestrial', false, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Largest planet in the Solar System', 'Gas Giant', false, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Known for its prominent ring system', 'Gas Giant', false, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'An ice giant with a unique tilt', 'Ice Giant', false, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Farthest planet from the Sun', 'Ice Giant', false, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES (8, 'Proxima b', 'Exoplanet orbiting Proxima Centauri', 'Terrestrial', false, NULL, NULL, NULL, NULL, NULL, 1, 4);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', 'Potentially habitable exoplanet', 'Terrestrial', false, NULL, NULL, NULL, NULL, NULL, 2, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'A planet in the habitable zone', 'Super-Earth', false, NULL, NULL, NULL, NULL, NULL, 2, 5);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'First exoplanet discovered in transit', 'Gas Giant', false, NULL, NULL, NULL, NULL, NULL, 3, 6);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'One of seven Earth-like planets', 'Terrestrial', false, NULL, NULL, NULL, NULL, NULL, 3, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System', 'G-Type Main-Sequence', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', 'A-Type Main-Sequence', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant in Orion', 'Red Supergiant', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Closest known star to the Sun', 'M-Type Main-Sequence', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Bright blue supergiant in Orion', 'Blue Supergiant', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (6, 'Vega', 'Brightest star in the Lyra constellation', 'A-Type Main-Sequence', NULL, NULL, NULL, NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_list_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy_list galaxy_list_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_list
    ADD CONSTRAINT galaxy_list_description_key UNIQUE (description);


--
-- Name: galaxy_list galaxy_list_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_list
    ADD CONSTRAINT galaxy_list_pkey PRIMARY KEY (galaxy_list_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

