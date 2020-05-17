-- name: ListAlbums :many
SELECT
    artist.name AS artist_name,
    album.date AS album_date,
    album.title AS album_title,
    album.state AS album_state
FROM album
JOIN artist ON album.artist_id = artist.id
ORDER BY artist.name ASC, album.date ASC, album.title ASC;

-- name: ListDraftAlbums :many
SELECT
    draft_album.id AS album_id,
    draft_album.path AS album_path,
    draft_album.date AS album_date,
    draft_album.title AS album_title
FROM draft_album
ORDER BY album_path ASC, draft_album.date ASC, draft_album.title ASC;

-- name: GetCommitedAlbumPaths :many
SELECT path FROM album;

-- name: GetDraftAlbumPaths :many
SELECT path FROM draft_album;

-- name: GetCommitedAlbumByID :one
SELECT * FROM album WHERE id = $1::uuid;

-- name: GetDraftAlbumByID :one
SELECT * FROM draft_album WHERE id = $1::uuid;

-- name: UpdateAlbum :exec
UPDATE album SET
    artist_id		= $2,
    title			= $3,
    date			= $4,
    mbid			= $5,
    type			= $6,
    edition_title	= $7,
    release_date	= $8,
    barcode			= $9,
    download_source	= $10,
    source_id		= $11,
    comment			= $12,
    state		    = $13,

    updated_at = NOW()
WHERE id = $1;

-- name: InsertDraftAlbum :exec
INSERT INTO draft_album (
    id,
    artist,
    title,
    date,
    type,
    download_source,
    path,

    rg_gain,
    rg_peak,

    created_at,
    updated_at
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
    NOW(),
    NOW()
);
