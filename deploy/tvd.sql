-- Deploy tvd:tvd to pg

BEGIN;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = newtbmap, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tvd; Type: TABLE; Schema: newtbmap; Tablespace:
--

CREATE TABLE newtbmap.tvd (
    id integer NOT NULL,
    name character varying(64),
    freeway_dir character varying(2),
    lanes integer,
    length numeric,
    cal_pm character varying(12),
    abs_pm double precision,
    latitude numeric,
    longitude numeric,
    last_modified date,
    gid integer,
    geom public.geometry,
    freeway_id integer,
    vdstype character varying(4),
    district integer
);

--
-- Name: tvd_pkey; Type: CONSTRAINT; Schema: newtbmap; Owner: slash; Tablespace:
--

ALTER TABLE ONLY tvd
    ADD CONSTRAINT tvd_pkey PRIMARY KEY (id);


--
-- Name: newtbmap_tvd_geom; Type: INDEX; Schema: newtbmap; Owner: slash; Tablespace:
--

CREATE INDEX newtbmap_tvd_geom ON tvd USING gist (geom);


COMMIT;
