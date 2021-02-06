BEGIN;
    ALTER TABLE album
        ADD COLUMN enabled_at timestamp with time zone;

    UPDATE album
        SET enabled_at = created_at
        WHERE state = 'enabled' AND created_at <= '2019-01-01';

    UPDATE album
        SET enabled_at = updated_at
        WHERE state = 'enabled' AND enabled_at IS NULL;

    ALTER TABLE album
        ADD CONSTRAINT album_enabled_at_check CHECK (
            state <> 'enabled'::album_state_enum OR enabled_at IS NOT NULL
        );

    CREATE FUNCTION private.set_enabled_at()
        RETURNS trigger
        LANGUAGE 'plpgsql'
    AS $BODY$
    BEGIN
        IF (
            NEW.state = 'enabled'::album_state_enum
            AND NEW.state != OLD.state
            AND enabled_at IS NULL
        ) THEN
            NEW.enabled_at := current_timestamp;
        END IF;
        RETURN NEW;
    END;
    $BODY$;

    CREATE TRIGGER album_enabled_at
        BEFORE UPDATE
        ON album
        FOR EACH ROW
        EXECUTE PROCEDURE private.set_enabled_at();
COMMIT;
