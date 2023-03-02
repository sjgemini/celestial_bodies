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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km numeric,
    closest_distance_to_earth_in_millions_of_kms integer,
    last_visible_from_earth date,
    short_period boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_light_years numeric,
    constellation text,
    category character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km numeric,
    is_spherical boolean,
    closest_planet character varying(60),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km numeric,
    supports_life boolean,
    planet_type_by_composition character varying(60),
    number_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km numeric,
    distance_from_earth_in_light_years integer,
    visible_from_earth boolean,
    constellation character varying(60),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 11, 5, '1986-02-09', true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 74, 193, '1997-03-22', false);
INSERT INTO public.comet VALUES (3, 'Swift Tuttle', 26, 142, '1992-12-15', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Sagittarius', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 152000, 'Andromeda', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Cosmos Redshift 7', 12000000000, 'Sextans', 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Peekaboo', 1200, 'Hydra', 'Compact blue dwarf');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 132000, 'Virgo', 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Medusa Merger', 28475, 'Ursa Major', 'Barred spiral');
INSERT INTO public.galaxy VALUES (7, 'Triangulum', 61100, 'Triangulum', 'Spiral');
INSERT INTO public.galaxy VALUES (8, 'Tadpole', 280000, 'Draco', 'Barred spiral');
INSERT INTO public.galaxy VALUES (9, 'Cigar', 40800, 'Ursa Major', 'Starburst');
INSERT INTO public.galaxy VALUES (10, 'eye of Sauron', 58040, 'Canes Venatici', 'Spial seyfert');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earths Moon', 3476, true, 'Earth', 1);
INSERT INTO public.moon VALUES (2, 'Callisto', 4821, true, 'Jupiter', 5);
INSERT INTO public.moon VALUES (3, 'Rosalind', 36, true, 'Uranus', 7);
INSERT INTO public.moon VALUES (4, 'Atlas', 30, false, 'Saturn', 6);
INSERT INTO public.moon VALUES (5, 'Enceladus', 504, true, 'Saturn', 6);
INSERT INTO public.moon VALUES (6, 'Charon', 1211, true, 'Pluto', 11);
INSERT INTO public.moon VALUES (7, 'Phobos', 22, false, 'Mars', 4);
INSERT INTO public.moon VALUES (8, 'Deimos', 12, false, 'Mars', 4);
INSERT INTO public.moon VALUES (9, 'Triton', 2700, false, 'Neptune', 8);
INSERT INTO public.moon VALUES (10, 'Europa', 3121, true, 'Jupiter', 5);
INSERT INTO public.moon VALUES (11, 'Ganymede', 5268, true, 'Jupiter', 5);
INSERT INTO public.moon VALUES (12, 'Io', 3643, true, 'Jupiter', 5);
INSERT INTO public.moon VALUES (13, 'Ariel', 1155, true, 'Uranus', 7);
INSERT INTO public.moon VALUES (14, 'Hyperion', 121, false, 'Saturn', 6);
INSERT INTO public.moon VALUES (15, 'Hydra', 51, false, 'Pluto', 11);
INSERT INTO public.moon VALUES (16, 'Larissa', 190, false, 'Neptune', 8);
INSERT INTO public.moon VALUES (17, 'Iapetus', 1469, true, 'Saturn', 6);
INSERT INTO public.moon VALUES (18, 'Vanth', 440, true, 'Orcus', 10);
INSERT INTO public.moon VALUES (19, 'Proteus', 420, false, 'Neptune', 8);
INSERT INTO public.moon VALUES (20, 'Pandora', 81, false, 'Saturn', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12756, true, 'Terrestrial', 1, 9);
INSERT INTO public.planet VALUES (2, 'Mercury', 4879, false, 'Terrestrial', 0, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 12102, false, 'Terrestrial', 0, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 6778, false, 'Terrestrial', 2, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139823, false, 'Gas Giant', 79, 10);
INSERT INTO public.planet VALUES (6, 'Saturn', 116465, false, 'Gas Giant', 83, 10);
INSERT INTO public.planet VALUES (7, 'Uranus', 50723, false, 'Ice Giant', 27, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 49242, false, 'Ice Giant', 14, 10);
INSERT INTO public.planet VALUES (9, 'Ceres', 939, true, 'Dwarf', 0, 5);
INSERT INTO public.planet VALUES (10, 'Orcus', 910, false, 'Dwarf', 1, 10);
INSERT INTO public.planet VALUES (11, 'Pluto', 2376, false, 'Dwarf', 5, 5);
INSERT INTO public.planet VALUES (12, 'Eris', 2325, false, 'Dwarf', 1, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Mimosa', 7494000, 280, true, 'Crux', 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 386160000, 643, true, 'Orion', 1);
INSERT INTO public.star VALUES (3, 'Nembus', 29501920, 173, true, 'Andromeda', 2);
INSERT INTO public.star VALUES (4, 'Alcor', 2568526, 86, true, 'Ursa Major', 9);
INSERT INTO public.star VALUES (5, 'Alphard', 70231772, 177, true, 'Hydra', 4);
INSERT INTO public.star VALUES (6, 'Kepler-10', 1468896, 564, true, 'Draco', 8);
INSERT INTO public.star VALUES (7, 'Epsilon Sextantis', 4369624, 193, true, 'Sextans', 3);
INSERT INTO public.star VALUES (8, 'Rigel', 108501972, 860, true, 'Orion', 1);
INSERT INTO public.star VALUES (9, 'Mizar', 4677104, 78, true, 'Ursa Major', 1);
INSERT INTO public.star VALUES (10, 'Alpha Pegasi', 6566123, 133, true, 'Pegasus', 2);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

