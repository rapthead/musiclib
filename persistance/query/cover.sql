-- name: DeleteCover :exec
DELETE FROM cover
WHERE id = $1;

-- name: GetCoversByAlbumID :many
SELECT * FROM cover
WHERE album_id = ANY($1::uuid[]);
