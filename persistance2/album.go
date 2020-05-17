package persistance2

import (
	"context"
	"errors"
	"fmt"

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

func (p *Queries) UpdateDraftAlbum(ctx context.Context, draftAlbum models.DraftAlbum) error {
	result, err := p.db.NamedExecContext(ctx, `
        UPDATE draft_album SET
            artist_id		= :artist_id,
            title			= :title,
            date			= :date,
            mbid			= :mbid,
            type			= :type,
            edition_title	= :edition_title,
            release_date	= :release_date,
            barcode			= :barcode,
            download_source	= :download_source,
            source_id		= :source_id,
            comment			= :comment,
            state		    = :state,

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
