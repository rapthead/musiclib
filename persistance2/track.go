package persistance2

import (
	"context"
	"errors"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
)

func (p *Queries) GetDraftTracksByAlbumID(ctx context.Context, id uuid.UUID) ([]models.DraftTrack, error) {
	draftAlbums := []models.DraftTrack{}
	err := p.db.SelectContext(ctx, &draftAlbums, `
        SELECT * FROM draft_track
        WHERE album_id = $1
        ORDER BY disc ASC, track_num ASC
    `, id)
	return draftAlbums, err
}

func (p *Queries) UpdateDraftTrack(ctx context.Context, draftTrack models.DraftTrack) error {
	result, err := p.db.NamedExecContext(ctx, `
        UPDATE draft_track SET
        track_artist = :track_artist,
        disc         = :disc,
        length       = :length,
        path         = :path,
        title        = :title,
        track_num    = :track_num
        WHERE id = :id;
    `, draftTrack)
	if err != nil {
		return fmt.Errorf("draft track updation error: %w", err)
	}
	if affectedCount, err := result.RowsAffected(); err != nil {
		return fmt.Errorf("draft track updation error, can't get affected rows count: %w", err)
	} else if affectedCount == 0 {
		return errors.New("draft track was not found")
	}
	return nil
}
