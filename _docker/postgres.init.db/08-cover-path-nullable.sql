BEGIN;
    ALTER TABLE cover ALTER COLUMN path DROP NOT NULL;
COMMIT;
