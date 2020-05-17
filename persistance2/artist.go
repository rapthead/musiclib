package persistance2

import (
	"context"

	"github.com/gofrs/uuid"

	"github.com/rapthead/musiclib/models"
)

func (p *Queries) GetArtistById(ctx context.Context, id uuid.UUID) (models.Artist, error) {
	artist := models.Artist{}
	err := p.db.GetContext(ctx, &artist, `
        SELECT * FROM artist
        WHERE id = $1
    `, id)
	return artist, err
}
