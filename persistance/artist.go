package persistance

import (
	"context"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
)

func (p *Queries) GetArtistByID(ctx context.Context, id uuid.UUID) (models.Artist, error) {
	artist := models.Artist{}
	err := p.db.SelectContext(ctx, &artist, `
        SELECT * FROM artist
        WHERE id = $1
    `, id)
	return artist, err
}

func (p *Queries) ListArtists(ctx context.Context) ([]models.Artist, error) {
	artists := []models.Artist{}
	err := p.db.SelectContext(ctx, &artists, `
        SELECT * FROM artist
        ORDER BY name ASC
    `)
	return artists, err
}

func (p *Queries) InsertOrGetArtist(ctx context.Context, artistName string) (models.Artist, error) {
	artist := models.Artist{}
	err := p.db.GetContext(ctx, &artist, `
        WITH existen_artist AS (
            SELECT * FROM artist WHERE name = $1
        ), inserted_artist AS (
            INSERT INTO artist (id, name)
            SELECT uuid_generate_v4(), $1
            WHERE NOT EXISTS (SELECT * FROM existen_artist)
            RETURNING *
        )
        SELECT * FROM existen_artist
        UNION ALL
        SELECT * FROM inserted_artist
    `, artistName)
	if err != nil {
		return artist, fmt.Errorf("insert or get artist failed: %w", err)
	}
	return artist, nil
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
