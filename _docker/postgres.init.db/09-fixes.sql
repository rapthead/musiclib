BEGIN;
    UPDATE track SET path = '10 Mouthwash - Neon Heartbeat.flac'
    FROM album
    JOIN artist ON artist.id = album.artist_id
    WHERE track.album_id = album.id AND album.title = '1000 Dreams' AND track_num = 10;

    UPDATE track SET path = '11 Mouthwash - Saving Grace.flac'
    FROM album
    JOIN artist ON artist.id = album.artist_id
    WHERE track.album_id = album.id AND album.title = '1000 Dreams' AND track_num = 11;

    UPDATE track SET path = path || '.flac'
    WHERE track.path NOT ILIKE '%.flac';
COMMIT;
