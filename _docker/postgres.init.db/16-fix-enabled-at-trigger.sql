BEGIN;
    CREATE OR REPLACE FUNCTION private.set_enabled_at()
        RETURNS trigger
        LANGUAGE 'plpgsql'
    AS $BODY$
    BEGIN
        IF (
            NEW.state = 'enabled'::album_state_enum
            AND NEW.state != OLD.state
            AND NEW.enabled_at IS NULL
        ) THEN
            NEW.enabled_at := current_timestamp;
        END IF;
        RETURN NEW;
    END;
    $BODY$;
COMMIT;
