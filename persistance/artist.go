package persistance

import (
	"context"
	"fmt"

	"github.com/rapthead/musiclib/models"
)

func (p *Queries) ListArtists(ctx context.Context) ([]models.Artist, error) {
	artists := []models.Artist{}
	err := p.db.SelectContext(ctx, &artists, `
        SELECT * FROM artist
        ORDER BY name ASC
    `)
	return artists, err
}

func (p *Queries) DeleteUnusedArtists(ctx context.Context) error {
	_, err := p.db.ExecContext(ctx, `
        DELETE FROM artist
        WHERE NOT EXISTS (
            SELECT * FROM album
            WHERE album.artist_id = artist.id
        )
    `)
	if err != nil {
		return fmt.Errorf("unused artist deletion failed: %w", err)
	}
	return nil
}
