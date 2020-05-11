--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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

--
-- Name: private; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA private;


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: album_state_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.album_state_enum AS ENUM (
    'disabled',
    'enabled',
    'deleted'
);


--
-- Name: album_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.album_type_enum AS ENUM (
    'LP',
    'EP',
    'Anthology',
    'Soundtrack',
    'Compilation',
    'Single',
    'Live'
);


--
-- Name: cover_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.cover_type_enum AS ENUM (
    'back out',
    'front out',
    'back in',
    'front in',
    'disc',
    'in',
    'out',
    'booklet',
    'other'
);


--
-- Name: download_source_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.download_source_enum AS ENUM (
    'MY',
    'WHAT_CD',
    'WAFFLES_FM',
    'REDACTED_CH'
);


--
-- Name: non_empty_trimmed_string; Type: DOMAIN; Schema: public; Owner: -
--

CREATE DOMAIN text AS text
	CONSTRAINT non_empty_trimmed_string_check CHECK (((btrim(VALUE) <> ''::text) AND (btrim(VALUE) = VALUE)));


--
-- Name: set_updated_at(); Type: FUNCTION; Schema: private; Owner: -
--

CREATE FUNCTION private.set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
      new.updated_at := current_timestamp;
      return new;
end;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: album; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.album (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    old_path text NOT NULL,
    title text NOT NULL,
    date date NOT NULL,
    release_date date,
    barcode text,
    source_id text,
    comment text,
    edition_title text,
    mbid text,
    rg_peak real NOT NULL,
    rg_gain real NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    type public.album_type_enum NOT NULL,
    download_source public.download_source_enum NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    artist_id uuid NOT NULL,
    state public.album_state_enum DEFAULT 'disabled'::public.album_state_enum NOT NULL,
    path text NOT NULL,
    CONSTRAINT album_rg_check CHECK (((rg_peak IS NULL) = (rg_gain IS NULL)))
);


--
-- Name: genre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genre (
    name text NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL
);


--
-- Name: album_genresByAlbumId(public.album); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public."album_genresByAlbumId"(a public.album) RETURNS SETOF public.genre
    LANGUAGE sql STABLE
    AS $$
  select genre.*
  from genre
  inner join album_genre
  on (album_genre.genre_id = genre.genre_id)
  where album_genre.album_id = a.album_id;
$$;


--
-- Name: diesel_set_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.diesel_set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (
        NEW IS DISTINCT FROM OLD AND
        NEW.updated_at IS NOT DISTINCT FROM OLD.updated_at
    ) THEN
        NEW.updated_at := current_timestamp;
    END IF;
    RETURN NEW;
END;
$$;


--
-- Name: album_genre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.album_genre (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    album_id uuid NOT NULL,
    genre_id uuid NOT NULL
);


--
-- Name: flac_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flac_files (
    type text NOT NULL,
    inode integer NOT NULL,
    path text NOT NULL,
    album_path text NOT NULL,
    file_path text NOT NULL
);


--
-- Name: artist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist (
    name text NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL
);


--
-- Name: cover; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cover (
    path text NOT NULL,
    sort bigint,
    type public.cover_type_enum NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    album_id uuid NOT NULL
);


--
-- Name: draft_album; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.draft_album (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    path text NOT NULL,
    title text,
    date date,
    release_date date,
    barcode text,
    source_id text,
    comment text,
    edition_title text,
    mbid text,
    rg_peak real,
    rg_gain real,
    type public.album_type_enum DEFAULT 'LP'::public.album_type_enum NOT NULL,
    download_source public.download_source_enum,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    artist_id uuid,
    artist text
);


--
-- Name: draft_track; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.draft_track (
    track_num bigint,
    title text,
    track_artist text,
    disc bigint,
    lirycs text,
    rg_peak real,
    rg_gain real,
    path text NOT NULL,
    length bigint NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    album_id uuid NOT NULL
);


--
-- Name: label; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.label (
    mbid text,
    name text NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL
);


--
-- Name: playlog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.playlog (
    "time" timestamp with time zone NOT NULL,
    source bigint NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    track_id uuid NOT NULL
);


--
-- Name: release; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.release (
    catalog_num text,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    album_id uuid NOT NULL,
    label_id uuid
);


--
-- Name: track; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.track (
    track_num bigint NOT NULL,
    title text NOT NULL,
    track_artist text,
    disc bigint DEFAULT 1 NOT NULL,
    lirycs text,
    rg_peak real NOT NULL,
    rg_gain real NOT NULL,
    old_path text NOT NULL,
    length bigint NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    album_id uuid NOT NULL,
    path text NOT NULL
);


--
-- Name: album_genre album_genre_album_id_genre_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.album_genre
    ADD CONSTRAINT album_genre_album_id_genre_id_key UNIQUE (album_id, genre_id);


--
-- Name: album_genre album_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.album_genre
    ADD CONSTRAINT album_genre_pkey PRIMARY KEY (id);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- Name: cover cover_album_id_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cover
    ADD CONSTRAINT cover_album_id_path_key UNIQUE (album_id, path);


--
-- Name: cover cover_album_id_type_sort_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cover
    ADD CONSTRAINT cover_album_id_type_sort_key UNIQUE (album_id, type, sort);


--
-- Name: cover cover_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cover
    ADD CONSTRAINT cover_pkey PRIMARY KEY (id);


--
-- Name: draft_album draft_album_path_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.draft_album
    ADD CONSTRAINT draft_album_path_unique UNIQUE (path);


--
-- Name: draft_album draft_album_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.draft_album
    ADD CONSTRAINT draft_album_pkey PRIMARY KEY (id);


--
-- Name: draft_track draft_track_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.draft_track
    ADD CONSTRAINT draft_track_pkey PRIMARY KEY (id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: playlog playlog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlog
    ADD CONSTRAINT playlog_pkey PRIMARY KEY (id);


--
-- Name: release release_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_pkey PRIMARY KEY (id);


--
-- Name: track track_album_id_track_num_disc_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_album_id_track_num_disc_uniq UNIQUE (album_id, track_num, disc);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id);


--
-- Name: album_path_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX album_path_unique ON public.album USING btree (old_path);


--
-- Name: genre_name_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX genre_name_unique ON public.genre USING btree (name);


--
-- Name: idx_359968_musicdb_artist_b068931c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_359968_musicdb_artist_b068931c ON public.artist USING btree (name);


--
-- Name: label_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX label_name_index ON public.label USING btree (name);


--
-- Name: album album_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER album_updated_at BEFORE UPDATE ON public.album FOR EACH ROW EXECUTE PROCEDURE private.set_updated_at();


--
-- Name: draft_album draft_album_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER draft_album_updated_at BEFORE UPDATE ON public.draft_album FOR EACH ROW EXECUTE PROCEDURE private.set_updated_at();


--
-- Name: album album_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(id);


--
-- Name: album_genre album_genre_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.album_genre
    ADD CONSTRAINT album_genre_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(id);


--
-- Name: album_genre album_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.album_genre
    ADD CONSTRAINT album_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(id);


--
-- Name: cover cover_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cover
    ADD CONSTRAINT cover_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(id);


--
-- Name: draft_album draft_album_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.draft_album
    ADD CONSTRAINT draft_album_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(id) ON DELETE CASCADE;


--
-- Name: draft_track draft_track_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.draft_track
    ADD CONSTRAINT draft_track_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.draft_album(id) ON DELETE CASCADE;


--
-- Name: playlog playlog_track_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlog
    ADD CONSTRAINT playlog_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.track(id);


--
-- Name: release release_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(id);


--
-- Name: release release_label_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_label_id_fkey FOREIGN KEY (label_id) REFERENCES public.label(id);


--
-- Name: track track_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(id);


--
-- PostgreSQL database dump complete
--

