BEGIN;
    ALTER TABLE album
        ADD COLUMN year INT,
        ADD COLUMN release_year INT;
    UPDATE album SET
        year = EXTRACT(YEAR FROM date),
        release_year = EXTRACT(YEAR FROM release_date)
    ;
    ALTER TABLE album
        ALTER COLUMN year SET NOT NULL,
        ADD CONSTRAINT album_year_check CHECK (year > 1900 AND year <= EXTRACT(YEAR FROM CURRENT_DATE)),
        ADD CONSTRAINT album_release_year_check CHECK (release_year IS NULL OR (release_year > 1900 AND year <= EXTRACT(YEAR FROM CURRENT_DATE))),
        ADD CONSTRAINT album_years_check CHECK (year <= release_year IS NOT FALSE)
    ;
    ALTER TABLE draft_album
        DROP COLUMN date,
        DROP COLUMN release_date,
        ADD COLUMN year INT NOT NULL,
        ADD COLUMN release_year INT,
        ADD CONSTRAINT draft_album_year_check CHECK (year IS NULL OR (year > 1900 AND year < EXTRACT(YEAR FROM CURRENT_DATE))),
        ADD CONSTRAINT draft_album_release_year_check CHECK (release_year IS NULL OR (release_year > 1900 AND year <= EXTRACT(YEAR FROM CURRENT_DATE)));
COMMIT;
