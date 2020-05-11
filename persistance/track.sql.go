// Code generated by sqlc. DO NOT EDIT.
// source: track.sql

package persistance

import (
	"context"
	"database/sql"

	"github.com/google/uuid"
)

const getAllMetadata = `-- name: GetAllMetadata :many
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
ORDER BY album.id
`

type GetAllMetadataRow struct {
	Path            string         `json:"path"`
	AlbumArtistName string         `json:"album_artist_name"`
	AlbumTitle      string         `json:"album_title"`
	Year            int32          `json:"year"`
	TrackArtistName sql.NullString `json:"track_artist_name"`
	TrackTitle      string         `json:"track_title"`
	TrackNumber     int64          `json:"track_number"`
}

func (q *Queries) GetAllMetadata(ctx context.Context) ([]GetAllMetadataRow, error) {
	rows, err := q.db.QueryContext(ctx, getAllMetadata)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetAllMetadataRow
	for rows.Next() {
		var i GetAllMetadataRow
		if err := rows.Scan(
			&i.Path,
			&i.AlbumArtistName,
			&i.AlbumTitle,
			&i.Year,
			&i.TrackArtistName,
			&i.TrackTitle,
			&i.TrackNumber,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const getCommitedTracksByAlbumID = `-- name: GetCommitedTracksByAlbumID :many
SELECT track_num, title, track_artist, disc, lirycs, rg_peak, rg_gain, old_path, length, id, album_id, path FROM track
WHERE album_id = $1
`

func (q *Queries) GetCommitedTracksByAlbumID(ctx context.Context, albumID uuid.UUID) ([]Track, error) {
	rows, err := q.db.QueryContext(ctx, getCommitedTracksByAlbumID, albumID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Track
	for rows.Next() {
		var i Track
		if err := rows.Scan(
			&i.TrackNum,
			&i.Title,
			&i.TrackArtist,
			&i.Disc,
			&i.Lirycs,
			&i.RgPeak,
			&i.RgGain,
			&i.OldPath,
			&i.Length,
			&i.ID,
			&i.AlbumID,
			&i.Path,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const insertDraftTrack = `-- name: InsertDraftTrack :exec
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
)
`

type InsertDraftTrackParams struct {
	ID          uuid.UUID       `json:"id"`
	AlbumID     uuid.UUID       `json:"album_id"`
	TrackArtist sql.NullString  `json:"track_artist"`
	Disc        sql.NullInt64   `json:"disc"`
	Length      int64           `json:"length"`
	Path        string          `json:"path"`
	Title       sql.NullString  `json:"title"`
	TrackNum    sql.NullInt64   `json:"track_num"`
	RgGain      sql.NullFloat64 `json:"rg_gain"`
	RgPeak      sql.NullFloat64 `json:"rg_peak"`
}

func (q *Queries) InsertDraftTrack(ctx context.Context, arg InsertDraftTrackParams) error {
	_, err := q.db.ExecContext(ctx, insertDraftTrack,
		arg.ID,
		arg.AlbumID,
		arg.TrackArtist,
		arg.Disc,
		arg.Length,
		arg.Path,
		arg.Title,
		arg.TrackNum,
		arg.RgGain,
		arg.RgPeak,
	)
	return err
}

const updateTrack = `-- name: UpdateTrack :exec
UPDATE track SET
    track_artist = $3,
    disc = $4,
    length = $5,
    path = $6,
    title = $7,
    track_num = $8,
    rg_peak = $9,
    rg_gain = $10
WHERE id = $1 AND album_id = $2
`

type UpdateTrackParams struct {
	ID          uuid.UUID      `json:"id"`
	AlbumID     uuid.UUID      `json:"album_id"`
	TrackArtist sql.NullString `json:"track_artist"`
	Disc        int64          `json:"disc"`
	Length      int64          `json:"length"`
	Path        string         `json:"path"`
	Title       string         `json:"title"`
	TrackNum    int64          `json:"track_num"`
	RgPeak      float32        `json:"rg_peak"`
	RgGain      float32        `json:"rg_gain"`
}

func (q *Queries) UpdateTrack(ctx context.Context, arg UpdateTrackParams) error {
	_, err := q.db.ExecContext(ctx, updateTrack,
		arg.ID,
		arg.AlbumID,
		arg.TrackArtist,
		arg.Disc,
		arg.Length,
		arg.Path,
		arg.Title,
		arg.TrackNum,
		arg.RgPeak,
		arg.RgGain,
	)
	return err
}
