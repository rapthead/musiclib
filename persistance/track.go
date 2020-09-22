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
		CONCAT(album.path, '/', track.path)::TEXT as ORIGINALFILENAME,
		artist.name as ALBUMARTIST,
		album.title || COALESCE(
            ' ◆ ' || NULLIF(NULLIF(album.edition_title, ''), 'Original Release')
            , ''
        ) as ALBUM,
        COALESCE(
            NULLIF(album.year, album.release_year)::text || '/' || album.release_year::text,
            album.year::text
        ) as DATE,
        album.year::text as ORIGINALDATE,
		album.type as RELEASETYPE,

		COALESCE(NULLIF(track.track_artist, ''), artist.name) as ARTIST,
		track.title as TITLE,

		track.disc as DISCNUMBER,
		(
		    SELECT MAX(disc)
		    FROM track AS t
		    WHERE t.album_id = track.album_id
		) as DISCTOTAL,

		track.track_num as TRACKNUMBER,
		(
		    SELECT MAX(track_num)
		    FROM track AS t
		    WHERE
			t.album_id = track.album_id
			AND t.disc = track.disc
		) as TRACKTOTAL,

		(
		    SELECT ARRAY_AGG(label.name)::TEXT[]
		    FROM release
		    JOIN label ON release.label_id = label.id
		    WHERE
			release.album_id = track.album_id
		) as LABELS,

		album.rg_gain as REPLAYGAIN_ALBUM_GAIN,
		album.rg_peak as REPLAYGAIN_ALBUM_PEAK,

		track.rg_gain as REPLAYGAIN_TRACK_GAIN,
		track.rg_peak as REPLAYGAIN_TRACK_PEAK
	FROM track
	JOIN album ON track.album_id = album.id
	JOIN artist ON album.artist_id = artist.id
	WHERE track.album_state = 'enabled'
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
