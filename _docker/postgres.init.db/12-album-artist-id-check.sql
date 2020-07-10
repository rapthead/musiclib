BEGIN;
    ALTER TABLE album
        ADD CONSTRAINT album_artist_id_check CHECK (
            state = 'draft' OR artist_id IS NOT NULL
        );
COMMIT;
