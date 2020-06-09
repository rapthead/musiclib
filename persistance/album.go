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

func (p *Queries) ListAlbums(ctx context.Context) ([]models.Album, error) {
	albums := []models.Album{}
	err := p.db.SelectContext(ctx, &albums, `
        SELECT * FROM album
        ORDER BY state ASC, created_at DESC, path ASC
    `)
	return albums, err
}

func (p *Queries) ListDraftAlbums(ctx context.Context) ([]models.DraftAlbum, error) {
	draftAlbums := []models.DraftAlbum{}
	err := p.db.SelectContext(ctx, &draftAlbums, `
        SELECT * FROM draft_album
        ORDER BY path ASC
    `)
	return draftAlbums, err
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

func (p *Queries) GetDraftAlbumByID(ctx context.Context, id uuid.UUID) (models.DraftAlbum, error) {
	draftAlbum := models.DraftAlbum{}
	err := p.db.GetContext(ctx, &draftAlbum, `
        SELECT * FROM draft_album
        WHERE id = $1
    `, id)
	if err == sql.ErrNoRows {
		return draftAlbum, DraftAlbumNotFound
	}
	return draftAlbum, err
}

func (p *Queries) GetExistenPaths(ctx context.Context) ([]string, error) {
	rows, err := p.db.QueryContext(ctx, `
        SELECT path FROM draft_album
        UNION ALL
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

func (p *Queries) UpdateDraftAlbum(ctx context.Context, draftAlbum models.DraftAlbum) error {
	result, err := p.db.NamedExecContext(ctx, `
        UPDATE draft_album SET
            title			= :title,
            artist		    = :artist,
            year			= :year,
            release_year	= :release_year,
            mbid			= :mbid,
            type			= :type,
            edition_title	= :edition_title,
            barcode			= :barcode,
            download_source	= :download_source,
            source_url		= :source_url,
            comment			= :comment,

            updated_at = NOW()
        WHERE id = :id;
    `, draftAlbum)
	if err != nil {
		return fmt.Errorf("draft album updation error: %w", err)
	}
	if affectedCount, err := result.RowsAffected(); err != nil {
		return fmt.Errorf("draft album updation error, can't get affected rows count: %w", err)
	} else if affectedCount == 0 {
		return DraftAlbumNotFound
	}
	return nil
}

func (p *Queries) InsertDraftAlbum(ctx context.Context, draftAlbum models.DraftAlbum) error {
	_, err := p.db.NamedExecContext(ctx, `
        INSERT INTO draft_album (
            id,
            artist,
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
            :artist,
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
        DELETE FROM draft_album
        WHERE id = $1
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
            'enabled',
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
