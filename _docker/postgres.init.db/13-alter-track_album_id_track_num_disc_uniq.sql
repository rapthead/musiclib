BEGIN;
    ALTER TABLE ONLY track
        DROP CONSTRAINT track_album_id_track_num_disc_uniq;

    CREATE UNIQUE INDEX track_album_id_track_num_disc_uniq
        ON track (album_id, track_num, disc) WHERE (track.album_state != 'draft');
COMMIT;
