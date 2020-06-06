package persistance

import (
	"context"

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
