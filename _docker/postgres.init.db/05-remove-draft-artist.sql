BEGIN;
    ALTER TABLE draft_album DROP COLUMN artist_id;
COMMIT;
