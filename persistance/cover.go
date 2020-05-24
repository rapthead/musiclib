package persistance

import (
	"context"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
)

func (p *Queries) GetDraftCoversByAlbumID(ctx context.Context, id uuid.UUID) ([]models.DraftCover, error) {
	draftCovers := []models.DraftCover{}
	err := p.db.SelectContext(ctx, &draftCovers, `
        SELECT * FROM draft_cover
        WHERE album_id = $1
        ORDER BY type ASC, sort ASC
    `, id)
	return draftCovers, err
}

func (p *Queries) DeleteDraftCover(ctx context.Context, coverID uuid.UUID) error {
	_, err := p.db.ExecContext(ctx, `
        DELETE FROM draft_cover
        WHERE id = $1
    `, coverID)
	if err != nil {
		return fmt.Errorf("draft cover deletion error: %w", err)
	}
	return nil
}

func (p *Queries) UpdateDraftCover(ctx context.Context, draftCover models.DraftCover) error {
	_, err := p.db.NamedExecContext(ctx, `
        UPDATE draft_cover SET
            sort              = :sort,
            type              = :type
        WHERE id = :id
    `, draftCover)
	if err != nil {
		return fmt.Errorf("draft cover updation error: %w", err)
	}
	return nil
}

func (p *Queries) InsertDraftCover(ctx context.Context, draftCover models.DraftCover) error {
	_, err := p.db.NamedExecContext(ctx, `
        INSERT INTO draft_cover (
            id,
            original_filename,
            album_id,
            sort,
            type
        ) VALUES (
            :id,
            :original_filename,
            :album_id,
            :sort,
            :type
        )
    `, draftCover)
	if err != nil {
		fmt.Printf("%+v", draftCover)
		return fmt.Errorf("draft cover insertion error: %w", err)
	}
	return nil
}
