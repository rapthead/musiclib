package persistance

import (
	"context"
	"errors"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
)

var DraftCoverNotFound = errors.New("Draft cover not found")

func (p *Queries) GetCoversByAlbumID(ctx context.Context, id uuid.UUID) ([]models.Cover, error) {
	covers := []models.Cover{}
	err := p.db.SelectContext(ctx, &covers, `
        SELECT * FROM cover
        WHERE album_id = $1
        ORDER BY type ASC, sort ASC
    `, id)
	return covers, err
}

func (p *Queries) GetDraftCoversByAlbumID(ctx context.Context, id uuid.UUID) ([]models.DraftCover, error) {
	draftCovers := []models.DraftCover{}
	err := p.db.SelectContext(ctx, &draftCovers, `
        SELECT * FROM draft_cover
        WHERE album_id = $1
        ORDER BY type ASC, sort ASC
    `, id)
	return draftCovers, err
}

func (p *Queries) DeleteCover(ctx context.Context, coverID uuid.UUID) error {
	_, err := p.db.ExecContext(ctx, `
        DELETE FROM cover
        WHERE id = $1
    `, coverID)
	if err != nil {
		return fmt.Errorf("cover deletion error: %w", err)
	}
	return nil
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

func (p *Queries) UpdateCover(ctx context.Context, draftCover models.Cover) error {
	_, err := p.db.NamedExecContext(ctx, `
        UPDATE cover SET
            sort              = :sort,
            type              = :type
        WHERE id = :id
    `, draftCover)
	if err != nil {
		return fmt.Errorf("draft cover updation error: %w", err)
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

func (p *Queries) InsertCover(ctx context.Context, cover models.Cover) error {
	_, err := p.db.NamedExecContext(ctx, `
        INSERT INTO cover (
            id,
            album_id,
            sort,
            type
        ) VALUES (
            :id,
            :album_id,
            :sort,
            :type
        )
    `, cover)
	if err != nil {
		return fmt.Errorf("draft cover insertion error: %w", err)
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

func (p *Queries) CommitDraftCoversByAlbumID(ctx context.Context, id uuid.UUID) error {
	result, err := p.db.ExecContext(ctx, `
        INSERT INTO cover (
            id,
            album_id,
            sort,
            type
        ) SELECT
            id,
            album_id,
            sort,
            type
        FROM draft_cover
        WHERE album_id = $1
    `, id)
	if err != nil {
		return fmt.Errorf("draft covers commit error: %w", err)
	}
	rowsAffected, err := result.RowsAffected()
	if err != nil {
		return fmt.Errorf("cant get affected rows: %w", err)
	}
	if rowsAffected == 0 {
		return DraftCoverNotFound
	}
	return nil
}
