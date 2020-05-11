-- name: UpdateTrack :exec
UPDATE track SET
    track_artist = $3,
    disc = $4,
    length = $5,
    path = $6,
    title = $7,
    track_num = $8,
    rg_peak = $9,
    rg_gain = $10
WHERE id = $1 AND album_id = $2;

-- name: InsertDraftTrack :exec
INSERT INTO draft_track (
    id,
    album_id,
    track_artist,
    disc,
    length,
    path,
    title,
    track_num,
    rg_gain,
    rg_peak
) VALUES (
    $1,
    $2,
    $3,
    $4,
    $5,
    $6,
    $7,
    $8,
    $9,
    $10
);

-- name: GetCommitedTracksByAlbumID :many
SELECT * FROM track
WHERE album_id = $1;

-- name: GetAllMetadata :many
SELECT
        concat(album.path, '/', track.path)::TEXT as path,
        artist.name as album_artist_name,
        album.title as album_title,
        extract(year from date)::INT as year,
        track.track_artist as track_artist_name,
        track.title as track_title,
        track.track_num as track_number
FROM album
JOIN artist ON album.artist_id = artist.id
JOIN track ON track.album_id = album.id
WHERE album.state = 'enabled'
ORDER BY album.id;
