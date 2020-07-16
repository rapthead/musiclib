package persistance

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
	"log"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
)

var DraftAlbumNotFound = errors.New("Draft album not found")

var AlbumNotFound = errors.New("Album not found")

func (p *Queries) ListMergableAlbums(ctx context.Context, recientAlbumId uuid.UUID) ([]models.Album, error) {
	albums := []models.Album{}
	err := p.db.SelectContext(ctx, &albums, `
        SELECT * FROM album
        WHERE state = 'draft' AND
            (SELECT count(*) FROM track WHERE album_id = album.id)
            = (SELECT count(*) FROM track WHERE album_id = $1)
        ORDER BY created_at DESC, path ASC
    `, recientAlbumId)
	return albums, err
}

func (p *Queries) ListAlbums(ctx context.Context) ([]models.Album, error) {
	albums := []models.Album{}
	err := p.db.SelectContext(ctx, &albums, `
        SELECT * FROM album
        ORDER BY (
            CASE
                WHEN state = 'draft' THEN 0
                WHEN state = 'disabled' THEN 1
                WHEN state = 'enabled' THEN 2
                ELSE 3
            END
        ) ASC, created_at DESC, path ASC
    `)
	return albums, err
}

func (p *Queries) GetAlbumByID(ctx context.Context, id uuid.UUID) (models.Album, error) {
	album := models.Album{}
	err := p.db.GetContext(ctx, &album, `
        SELECT * FROM album
        WHERE id = $1
    `, id)
	if err == sql.ErrNoRows {
		return album, AlbumNotFound
	}
	return album, err
}

func (p *Queries) GetExistenPaths(ctx context.Context) ([]string, error) {
	rows, err := p.db.QueryContext(ctx, `
        SELECT path FROM album
    `)
	defer rows.Close()
	paths := make([]string, 0)
	for rows.Next() {
		var path string
		if err := rows.Scan(&path); err != nil {
			log.Fatal(err)
		}
		paths = append(paths, path)
	}
	return paths, err
}

func (p *Queries) UpdateAlbum(
	ctx context.Context,
	album models.Album,
) error {
	result, err := p.db.NamedExecContext(ctx, `
        UPDATE album SET
            artist_id       = :artist_id,
            draft_artist    = :draft_artist,
            state			= :state,
            title			= :title,
            year			= :year,
            release_year	= :release_year,
            mbid			= :mbid,
            type			= :type,
            edition_title	= :edition_title,
            barcode			= :barcode,
            download_source	= :download_source,
            source_url		= :source_url,
            comment			= :comment,

            path            = :path,
            rg_gain         = :rg_gain,
            rg_peak         = :rg_peak,

            updated_at = NOW()
        WHERE id = :id;
    `, album)
	if err != nil {
		return fmt.Errorf("album updation error: %w", err)
	}
	if affectedCount, err := result.RowsAffected(); err != nil {
		return fmt.Errorf("album updation error, can't get affected rows count: %w", err)
	} else if affectedCount == 0 {
		return AlbumNotFound
	}
	return nil
}

func (p *Queries) InsertAlbum(ctx context.Context, draftAlbum models.Album) error {
	_, err := p.db.NamedExecContext(ctx, `
        INSERT INTO album (
            id,
            draft_artist,
            title,
            year,
            type,
            download_source,
            path,

            rg_gain,
            rg_peak,

            created_at,
            updated_at
        ) VALUES (
            :id,
            :draft_artist,
            :title,
            :year,
            :type,
            :download_source,
            :path,

            :rg_gain,
            :rg_peak,

            NOW(),
            NOW()
        )
    `, draftAlbum)
	if err != nil {
		return fmt.Errorf("draft album insertion error: %w", err)
	}
	return nil
}

func (p *Queries) DeleteDraftAlbumByID(ctx context.Context, id uuid.UUID) error {
	result, err := p.db.ExecContext(ctx, `
        DELETE FROM album
        WHERE id = $1 AND state = 'draft'
    `, id)
	if err != nil {
		return fmt.Errorf("draft album deletion error: %w", err)
	}
	rowsAffected, err := result.RowsAffected()
	if err != nil {
		return fmt.Errorf("cant get affected rows: %w", err)
	}
	if rowsAffected == 0 {
		return DraftAlbumNotFound
	}
	return nil
}

func (p *Queries) CommitDraftAlbumByID(ctx context.Context, id uuid.UUID) error {
	result, err := p.db.ExecContext(ctx, `
        WITH existen_artist AS (
            SELECT id FROM artist WHERE name = (
                SELECT artist
                FROM draft_album
                WHERE id = $1
            )
        ), inserted_artist AS (
            INSERT INTO artist (id, name)
            SELECT uuid_generate_v4(), (
                SELECT artist
                FROM draft_album
                WHERE id = $1
            )
            WHERE NOT EXISTS (SELECT * FROM existen_artist)
            RETURNING id
        )
        INSERT INTO album (
            id,
            artist_id,
            title,
            state,
            type,

            edition_title,
            mbid,
            path,

            barcode,
            comment,

            download_source,
            source_url,

            year,
            release_year,

            rg_gain,
            rg_peak,

            updated_at,
            created_at
        ) SELECT
            id,
            COALESCE(
                (SELECT id FROM existen_artist),
                (SELECT id FROM inserted_artist)
            ),
            title,
            'disabled',
            type,

            edition_title,
            mbid,
            path,

            barcode,
            comment,

            download_source,
            source_url,

            year,
            release_year,

            rg_gain,
            rg_peak,

            updated_at,
            created_at
        FROM draft_album
        WHERE id = $1;
    `, id)
	if err != nil {
		return fmt.Errorf("draft album commit error: %w", err)
	}
	rowsAffected, err := result.RowsAffected()
	if err != nil {
		return fmt.Errorf("cant get affected rows: %w", err)
	}
	if rowsAffected == 0 {
		return DraftAlbumNotFound
	}
	return nil
}
