package persistance

import (
	"context"
	"errors"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
)

func (p *Queries) GetTracksByAlbumID(ctx context.Context, id uuid.UUID) ([]models.Track, error) {
	tracks := []models.Track{}
	err := p.db.SelectContext(ctx, &tracks, `
        SELECT * FROM track
        WHERE album_id = $1
        ORDER BY path ASC
    `, id)
	return tracks, err
}

func (p *Queries) UpdateTrack(ctx context.Context, track models.Track) error {
	result, err := p.db.NamedExecContext(ctx, `
        UPDATE track SET
            disc         = :disc,
            track_artist = :track_artist,
            title        = :title,
            track_num    = :track_num,

            path         = :path,
            rg_gain      = :rg_gain,
            rg_peak      = :rg_peak
        WHERE id = :id;
    `, track)
	if err != nil {
		return fmt.Errorf("track updation error: %w", err)
	}
	if affectedCount, err := result.RowsAffected(); err != nil {
		return fmt.Errorf("track updation error, can't get affected rows count: %w", err)
	} else if affectedCount == 0 {
		return errors.New("track was not found")
	}
	return nil
}

func (p *Queries) InsertTrack(ctx context.Context, track models.Track) error {
	_, err := p.db.NamedExecContext(ctx, `
        INSERT INTO track (
            id,
            album_id,
            album_state,
            track_artist,
            disc,
            length,
            path,
            title,
            track_num,
            rg_gain,
            rg_peak
        ) VALUES (
            :id,
            :album_id,
            :album_state,
            :track_artist,
            :disc,
            :length,
            :path,
            :title,
            :track_num,
            :rg_gain,
            :rg_peak
        )
    `, track)
	if err != nil {
		return fmt.Errorf("track insertion error: %w", err)
	}
	return nil
}

func (p *Queries) GetAllMetadata(ctx context.Context) ([]models.Metadata, error) {
	metas := []models.Metadata{}
	err := p.db.SelectContext(ctx, &metas, `
        SELECT
                concat(album.path, '/', track.path)::TEXT as path,
                artist.name as album_artist_name,
                album.title as album_title,
                album.year as year,
                (SELECT MAX(disc) FROM track WHERE album_id = album.id) as disc_total,
                track.disc as track_disc,
                track.track_artist as track_artist_name,
                track.title as track_title,
                track.track_num as track_number,

                album.rg_gain as album_rg_gain,
                album.rg_peak as album_rg_peak,

                track.rg_gain as track_rg_gain,
                track.rg_peak as track_rg_peak
        FROM album
        JOIN artist ON album.artist_id = artist.id
        JOIN track ON track.album_id = album.id
        WHERE album.state = 'enabled'
        ORDER BY artist.name ASC, year ASC, track_number ASC;
    `)
	if err != nil {
		return nil, fmt.Errorf("meta featching error: %w", err)
	}
	return metas, nil
}
