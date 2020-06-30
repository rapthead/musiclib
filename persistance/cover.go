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

func (p *Queries) InsertCover(ctx context.Context, cover models.Cover) error {
	_, err := p.db.NamedExecContext(ctx, `
        INSERT INTO cover (
            id,
            album_id,
            album_state,
            sort,
            type,
            filename
        ) VALUES (
            :id,
            :album_id,
            (SELECT state FROM album WHERE id = :album_id),
            :sort,
            :type,
            :filename
        )
    `, cover)
	if err != nil {
		return fmt.Errorf("draft cover insertion error: %w", err)
	}
	return nil
}
