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
        ORDER BY disc ASC, track_num ASC, path ASC;
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
		CONCAT(album.path, '/', track.path)::TEXT as original_filename,
		artist.name as album_artist,
		album.title as album_title,
        album.edition_title as edition_title,
        album.year as original_year,
        album.release_year as release_year,
		album.type as release_type,

		album.created_at as created_at,
		album.updated_at as updated_at,

		track.track_artist as track_artist,
		track.title as track_title,

		track.disc as disc_number,
		(
		    SELECT MAX(disc)
		    FROM track AS t
		    WHERE t.album_id = track.album_id
		) as disc_total,

		track.track_num as track_number,
		(
		    SELECT MAX(track_num)
		    FROM track AS t
		    WHERE
			t.album_id = track.album_id
			AND t.disc = track.disc
		) as track_total,

		(
		    SELECT ARRAY_AGG(label.name)::TEXT[]
		    FROM release
		    JOIN label ON release.label_id = label.id
		    WHERE
			release.album_id = track.album_id
		) as labels,

		album.rg_gain as replaygain_album_gain,
		album.rg_peak as replaygain_album_peak,

		track.rg_gain as replaygain_track_gain,
		track.rg_peak as replaygain_track_peak
	FROM track
	JOIN album ON track.album_id = album.id
	JOIN artist ON album.artist_id = artist.id
	WHERE track.album_state = 'enabled'
        AND album.id = 'b4d1f106-4b8d-4fbf-a162-81f4ca227194'
	ORDER BY
	    track.album_id ASC,
	    track.disc ASC,
	    track.track_num ASC
    `)
	if err != nil {
		return nil, fmt.Errorf("meta featching error: %w", err)
	}
	return metas, nil
}
