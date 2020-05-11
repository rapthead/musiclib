-- name: InsertArtist :exec
INSERT INTO artist (id, name)
VALUES ($1, $2);

-- name: DeleteArtist :exec
DELETE FROM artist
WHERE id = $1;

-- name: GetArtistById :one
SELECT * FROM artist
WHERE id = $1;
