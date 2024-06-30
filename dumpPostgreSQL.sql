--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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
-- Name: breed; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.breed (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    min_life_expectancy smallint,
    max_life_expectancy smallint,
    length_from smallint,
    length_to smallint,
    min_weight smallint,
    max_weight smallint,
    description text,
    spec_characteristic_id integer,
    CONSTRAINT breed_check CHECK ((max_weight >= min_weight)),
    CONSTRAINT breed_check1 CHECK ((length_from <= length_to)),
    CONSTRAINT breed_check2 CHECK ((max_life_expectancy >= min_life_expectancy)),
    CONSTRAINT breed_length_from_check CHECK ((length_from > 0)),
    CONSTRAINT breed_length_to_check CHECK ((length_to > 0)),
    CONSTRAINT breed_max_life_expectancy_check CHECK ((max_life_expectancy > 0)),
    CONSTRAINT breed_max_weight_check CHECK ((max_weight > 0)),
    CONSTRAINT breed_min_life_expectancy_check CHECK ((min_life_expectancy > 0)),
    CONSTRAINT breed_min_weight_check CHECK ((min_weight > 0))
);


--
-- Name: breedorigin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.breedorigin (
    breed_id integer NOT NULL,
    origin_id integer NOT NULL
);


--
-- Name: image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.image (
    breed_id integer,
    image_link character varying(255)
);


--
-- Name: origin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.origin (
    country_id integer NOT NULL,
    country_name character varying(60)
);


--
-- Name: origin_country_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.origin_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: origin_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.origin_country_id_seq OWNED BY public.origin.country_id;


--
-- Name: specialcharacteristic; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.specialcharacteristic (
    ch_id integer NOT NULL,
    family_friendly smallint,
    shedding smallint,
    general_health smallint,
    playfulness smallint,
    children_friendly smallint,
    grooming smallint,
    intelligence smallint,
    other_pets_friendly smallint,
    hypoallergenic boolean,
    CONSTRAINT specialcharacteristic_children_friendly_check CHECK ((children_friendly >= 0)),
    CONSTRAINT specialcharacteristic_family_friendly_check CHECK ((family_friendly >= 0)),
    CONSTRAINT specialcharacteristic_general_health_check CHECK ((general_health >= 0)),
    CONSTRAINT specialcharacteristic_grooming_check CHECK ((grooming >= 0)),
    CONSTRAINT specialcharacteristic_intelligence_check CHECK ((intelligence >= 0)),
    CONSTRAINT specialcharacteristic_other_pets_friendly_check CHECK ((other_pets_friendly >= 0)),
    CONSTRAINT specialcharacteristic_playfulness_check CHECK ((playfulness >= 0)),
    CONSTRAINT specialcharacteristic_shedding_check CHECK ((shedding >= 0))
);


--
-- Name: origin country_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.origin ALTER COLUMN country_id SET DEFAULT nextval('public.origin_country_id_seq'::regclass);


--
-- Name: breed breed_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.breed
    ADD CONSTRAINT breed_name_key UNIQUE (name);


--
-- Name: breed breed_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.breed
    ADD CONSTRAINT breed_pkey PRIMARY KEY (id);


--
-- Name: breed breed_spec_characteristic_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.breed
    ADD CONSTRAINT breed_spec_characteristic_id_key UNIQUE (spec_characteristic_id);


--
-- Name: breedorigin breedorigin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.breedorigin
    ADD CONSTRAINT breedorigin_pkey PRIMARY KEY (breed_id, origin_id);


--
-- Name: origin origin_country_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.origin
    ADD CONSTRAINT origin_country_name_key UNIQUE (country_name);


--
-- Name: origin origin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.origin
    ADD CONSTRAINT origin_pkey PRIMARY KEY (country_id);


--
-- Name: specialcharacteristic specialcharacteristic_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialcharacteristic
    ADD CONSTRAINT specialcharacteristic_pkey PRIMARY KEY (ch_id);


--
-- Name: breedorigin breedorigin_breed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.breedorigin
    ADD CONSTRAINT breedorigin_breed_id_fkey FOREIGN KEY (breed_id) REFERENCES public.breed(id) ON DELETE CASCADE;


--
-- Name: breedorigin breedorigin_origin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.breedorigin
    ADD CONSTRAINT breedorigin_origin_id_fkey FOREIGN KEY (origin_id) REFERENCES public.origin(country_id) ON DELETE CASCADE;


--
-- Name: image image_breed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_breed_id_fkey FOREIGN KEY (breed_id) REFERENCES public.breed(id) ON DELETE CASCADE;


--
-- Name: specialcharacteristic specialcharacteristic_ch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialcharacteristic
    ADD CONSTRAINT specialcharacteristic_ch_id_fkey FOREIGN KEY (ch_id) REFERENCES public.breed(spec_characteristic_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

