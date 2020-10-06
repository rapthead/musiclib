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

func (p *Queries) GetFuseCovers(ctx context.Context) ([]models.FuseCover, error) {
	m := []models.FuseCover{}
	err := p.db.SelectContext(ctx, &m, `
        SELECT
            cover.id as id,

            artist.name as album_artist,
            album.title as album_title,
            album.year as original_year,
            album.release_year as release_year,

            album.created_at as created_at,
            album.updated_at as updated_at
        FROM album
        JOIN cover ON album.id = cover.album_id
        JOIN artist ON album.artist_id = artist.id
        WHERE album.state = 'enabled' AND cover.type = 'front out'
            -- AND album.id = 'b4d1f106-4b8d-4fbf-a162-81f4ca227194'
    `)
	if err != nil {
		return nil, fmt.Errorf("draft cover insertion error: %w", err)
	}
	return m, nil
}
