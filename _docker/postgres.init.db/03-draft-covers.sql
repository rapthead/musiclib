BEGIN;
    CREATE TABLE draft_cover (
        id uuid DEFAULT uuid_generate_v4() NOT NULL,
        original_filename non_empty_trimmed_string NOT NULL,
        album_id uuid NOT NULL,
        sort bigint CHECK (sort > 0),
        type cover_type_enum NOT NULL,
        CONSTRAINT draft_cover_album_id_fkey
            FOREIGN KEY (album_id)
            REFERENCES draft_album(id)
            ON DELETE CASCADE
    );
COMMIT;
