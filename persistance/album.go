package persistance

import (
	"context"
	"errors"
	"fmt"
	"log"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
)

func (p *Queries) ListDraftAlbums(ctx context.Context) ([]models.DraftAlbum, error) {
	draftAlbums := []models.DraftAlbum{}
	err := p.db.SelectContext(ctx, &draftAlbums, `
        SELECT * FROM draft_album
        ORDER BY path ASC
    `)
	return draftAlbums, err
}

func (p *Queries) GetDraftAlbumByID(ctx context.Context, id uuid.UUID) (models.DraftAlbum, error) {
	draftAlbum := models.DraftAlbum{}
	err := p.db.GetContext(ctx, &draftAlbum, `
        SELECT * FROM draft_album
        WHERE id = $1
    `, id)
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
            artist_id		= :artist_id,
            year			= :year,
            release_year	= :release_year,
            mbid			= :mbid,
            type			= :type,
            edition_title	= :edition_title,
            barcode			= :barcode,
            download_source	= :download_source,
            source_id		= :source_id,
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
		return errors.New("draft album was not found")
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
