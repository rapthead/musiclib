BEGIN;
    UPDATE album SET mbid = 'fb8b5044-2fc0-4be8-8664-605aa5bdef22'
        WHERE mbid = 'fb8b5044-2fc0-4be8-8664-605aa5bdef2';

    CREATE DOMAIN string_input AS text
        DEFAULT ''
        CONSTRAINT string_input_check CHECK (btrim(VALUE) = VALUE);

    CREATE DOMAIN trimmed_string AS text
        CONSTRAINT trimmed_string_check CHECK (btrim(VALUE) = VALUE);

    CREATE OR REPLACE FUNCTION is_trimmed(VALUE text) RETURNS boolean
    LANGUAGE 'plpgsql' IMMUTABLE
    AS $BODY$
        BEGIN
            RETURN VALUE IS NULL OR btrim(VALUE) = VALUE;
        END
    $BODY$;

    CREATE OR REPLACE FUNCTION is_empty(VALUE text) RETURNS boolean
    LANGUAGE 'plpgsql' IMMUTABLE
    AS $BODY$
        BEGIN
            RETURN VALUE IS NULL OR VALUE = ''::text;
        END
    $BODY$;

    CREATE OR REPLACE FUNCTION is_draft(R album) RETURNS boolean
    LANGUAGE 'plpgsql' IMMUTABLE
    AS $BODY$
        BEGIN
            RETURN R.state = 'draft';
        END
    $BODY$;

    CREATE OR REPLACE FUNCTION is_draft(R track) RETURNS boolean
    LANGUAGE 'plpgsql' IMMUTABLE
    AS $BODY$
        BEGIN
            RETURN R.album_state = 'draft';
        END
    $BODY$;

    CREATE OR REPLACE FUNCTION is_draft(R cover) RETURNS boolean
    LANGUAGE 'plpgsql' IMMUTABLE
    AS $BODY$
        BEGIN
            RETURN R.album_state = 'draft';
        END
    $BODY$;

    ALTER TABLE album
        -- artist_id {
        ALTER COLUMN artist_id DROP NOT NULL,
        ADD CONSTRAINT commited_artist_id_check CHECK (
            is_draft(album) OR artist_id IS NOT NULL
        ),

        ADD COLUMN draft_artist string_input,
        -- artist_id }

        -- title {
        ALTER COLUMN title TYPE string_input,
        ALTER COLUMN title SET NOT NULL,

        ADD CONSTRAINT commited_title_check CHECK (
            is_draft(album) OR NOT is_empty(title)
        ),
        -- title }

        -- year {
        ALTER COLUMN year DROP NOT NULL,
        ADD CONSTRAINT commited_year_check CHECK (
            is_draft(album) OR year IS NOT NULL
        ),
        -- year }

        -- barcode {
        ALTER COLUMN barcode TYPE string_input USING COALESCE(barcode::string_input, ''::string_input),
        ALTER COLUMN barcode SET NOT NULL,
        -- barcode }

        -- source_url {
        ALTER COLUMN source_url TYPE string_input USING COALESCE(source_url::string_input, ''::string_input),
        ALTER COLUMN source_url SET NOT NULL,
        -- source_url }

        -- comment {
        ALTER COLUMN comment TYPE string_input USING COALESCE(comment::string_input, ''::string_input),
        ALTER COLUMN comment SET NOT NULL,
        -- comment }

        -- edition_title {
        ALTER COLUMN edition_title TYPE string_input USING COALESCE(edition_title::string_input, ''::string_input),
        ALTER COLUMN edition_title SET NOT NULL,
        -- edition_title }

        -- path {
        ALTER COLUMN path TYPE trimmed_string,
        ALTER COLUMN path SET NOT NULL,
        ADD CONSTRAINT path_check CHECK (
            NOT is_empty(path)
            AND btrim(path, '/') = path
        ),
        -- path }

        ALTER COLUMN mbid TYPE uuid USING mbid::uuid,
        ALTER COLUMN state SET DEFAULT 'draft'::album_state_enum,


        DROP CONSTRAINT album_source_url_check,
        ADD CONSTRAINT album_source_url_check CHECK (
            CASE
                WHEN is_draft(album) THEN true
                WHEN download_source = 'WHAT_CD'::download_source_enum THEN source_url ~ '^https://what.cd/torrents.php\?torrentid=\d+$'::text
                WHEN download_source = 'WAFFLES_FM'::download_source_enum THEN source_url ~ '^https://waffles.fm/details.php\?id=\d+$'::text
                WHEN download_source = 'REDACTED_CH'::download_source_enum THEN source_url ~ '^https://redacted.ch/torrents.php\?torrentid=\d+$'::text
                WHEN download_source = 'WEB'::download_source_enum THEN source_url <> ''
                ELSE true
            END
        ),

        ADD CONSTRAINT album_id_state_unique UNIQUE (id, state)
    ;

    ALTER TABLE track
        ADD COLUMN album_state album_state_enum;

    UPDATE track SET album_state = (
        SELECT state FROM album WHERE id = track.album_id
    );

    ALTER TABLE track RENAME COLUMN lirycs TO lyrics;
    UPDATE track SET lyrics = '' WHERE lyrics IS NULL;

    ALTER TABLE track
        ALTER COLUMN lyrics SET DEFAULT '',
        ALTER COLUMN lyrics SET NOT NULL,

        ALTER COLUMN album_state SET NOT NULL,

        DROP CONSTRAINT track_album_id_fkey,
        ADD CONSTRAINT track_album_id_album_state_fkey
            FOREIGN KEY (album_id, album_state)
            REFERENCES album (id, state)
            ON UPDATE CASCADE
            ON DELETE CASCADE,

        -- track_num {
        ALTER COLUMN track_num SET DEFAULT 0,
        -- track_num }

        -- title {
        ALTER COLUMN title TYPE string_input,
        ALTER COLUMN title SET NOT NULL,

        ADD CONSTRAINT commited_title_check CHECK (
            is_draft(track) OR NOT is_empty(title)
        ),
        -- title }

        -- track_artist {
        ALTER COLUMN track_artist TYPE string_input USING COALESCE(track_artist::string_input, ''::string_input),
        ALTER COLUMN track_artist SET NOT NULL,
        -- track_artist }

        -- path {
        ALTER COLUMN path TYPE trimmed_string,
        ALTER COLUMN path SET NOT NULL,
        ADD CONSTRAINT path_check CHECK (
            NOT is_empty(path)
            AND btrim(path, '/') = path
            AND path ILIKE '%.flac'
        )
        -- path }
    ;

    CREATE UNIQUE INDEX track_commited_album_id_track_num_disc_uniq
    ON track (album_id, track_num, disc) WHERE (NOT is_draft(track));

    ALTER TABLE cover
        ADD COLUMN album_state album_state_enum;

    UPDATE cover SET album_state = (
        SELECT state FROM album WHERE id = cover.album_id
    );

    ALTER TABLE cover
        ALTER COLUMN album_state SET NOT NULL,

        DROP CONSTRAINT cover_album_id_fkey,
        ADD CONSTRAINT  cover_album_id_album_state_fkey
            FOREIGN KEY (album_id, album_state)
            REFERENCES album (id, state)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        DROP CONSTRAINT cover_album_id_type_sort_key,

        ADD COLUMN filename trimmed_string
    ;

    CREATE UNIQUE INDEX cover_commited_album_id_type_sort_key_uniq
    ON cover (album_id, type, sort) WHERE (NOT is_draft(cover));

    DROP TABLE flac_files;
    DROP TABLE draft_cover;
    DROP TABLE draft_track;
    DROP TABLE draft_album;
COMMIT;
