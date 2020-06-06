BEGIN;
    ALTER TABLE album
        DROP COLUMN old_path,
        DROP COLUMN release_date,
        DROP COLUMN "date"
    ;
    ALTER TABLE track DROP COLUMN old_path;
COMMIT;
