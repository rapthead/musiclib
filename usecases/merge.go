package usecases

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
	"path"

	"github.com/gofrs/uuid"
	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance"
)

type mergeAlbumInfo struct {
	Album  models.Album
	Tracks []models.Track
}

type MergePreviewOutput struct {
	RecipientFilePaths []string
	DonorFilePaths     []string
}

type MergableAlbum struct {
	Album  models.Album
	Artist *models.Artist
}

type MergeAlbums struct {
	sqlxClient *sqlx.DB
	queries    *persistance.Queries
}

func NewMergeAlbums(deps interface {
	SQLXClient() *sqlx.DB
	Queries() *persistance.Queries
}) MergeAlbums {
	return MergeAlbums{
		deps.SQLXClient(),
		deps.Queries(),
	}
}

func (u MergeAlbums) getAlbumWithTracks(
	ctx context.Context, id uuid.UUID,
) (mergeAlbumInfo, error) {
	queries := u.queries

	result := mergeAlbumInfo{}

	album, err := queries.GetAlbumByID(ctx, id)
	if err != nil {
		if err == persistance.AlbumNotFound {
			return result, err
		} else {
			return result, fmt.Errorf("Unable to fetch album: %w", err)
		}
	}
	result.Album = album

	tracks, err := queries.GetTracksByAlbumID(ctx, id)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch tracks: %w", err)
	}
	result.Tracks = tracks

	return result, nil
}

func (u MergeAlbums) makeFilePath(a models.Album, t models.Track) string {
	return path.Join(a.Path, t.Path)
}

func (u MergeAlbums) getMergableAlbums(
	ctx context.Context, donorAlbumId uuid.UUID, recipientAlbumId uuid.UUID,
) (di mergeAlbumInfo, ri mergeAlbumInfo, err error) {
	di, err = u.getAlbumWithTracks(ctx, donorAlbumId)
	if err != nil {
		return di, ri, fmt.Errorf("Unable to get donor album: %w", err)
	} else if di.Album.State != models.AlbumStateEnumDraft {
		return di, ri, errors.New("Donor album must be in state 'draft'")
	}

	ri, err = u.getAlbumWithTracks(ctx, recipientAlbumId)
	if err != nil {
		return di, ri, fmt.Errorf("Unable to get donor album: %w", err)
	} else if ri.Album.State == models.AlbumStateEnumDraft {
		return di, ri, errors.New("Recipient album must not be in state 'draft'")
	}

	if len(di.Tracks) != len(ri.Tracks) {
		return di, ri, errors.New("Recipient albums tracks count missmatch")
	}
	return di, ri, nil
}

func (u MergeAlbums) Preview(
	ctx context.Context,
	donorAlbumId uuid.UUID, recipientAlbumId uuid.UUID,
) (MergePreviewOutput, error) {
	result := MergePreviewOutput{}

	donorAlbumInfo, recipientAlbumInfo, err :=
		u.getMergableAlbums(ctx, donorAlbumId, recipientAlbumId)
	if err != nil {
		return result, err
	}

	l := len(donorAlbumInfo.Tracks)
	donorFilePaths := make([]string, l, l)
	for i, t := range donorAlbumInfo.Tracks {
		donorFilePaths[i] = u.makeFilePath(donorAlbumInfo.Album, t)
	}

	l = len(recipientAlbumInfo.Tracks)
	recipientFilePaths := make([]string, l, l)
	for i, t := range recipientAlbumInfo.Tracks {
		recipientFilePaths[i] = u.makeFilePath(recipientAlbumInfo.Album, t)
	}

	result.RecipientFilePaths = recipientFilePaths
	result.DonorFilePaths = donorFilePaths

	return result, nil
}

func (u MergeAlbums) ListMergable(ctx context.Context, recipientAlbumID uuid.UUID) ([]MergableAlbum, error) {
	queries := u.queries
	albums, err := queries.ListMergableAlbums(ctx, recipientAlbumID)
	if err != nil {
		return []MergableAlbum{}, fmt.Errorf("Unable to fetch mergable albums list: %w", err)
	}

	artists, err := queries.ListArtists(ctx)
	if err != nil {
		return []MergableAlbum{}, fmt.Errorf("Unable to fetch album artists: %w", err)
	}

	artistsById := make(map[uuid.UUID]models.Artist)
	for _, artist := range artists {
		artistsById[artist.ID] = artist
	}

	result := make([]MergableAlbum, len(albums), len(albums))
	for i, album := range albums {
		var artistPtr *models.Artist
		if album.ArtistID.Valid {
			if artist, ok := artistsById[album.ArtistID.UUID]; ok {
				artistPtr = &artist
			} else {
				return result, fmt.Errorf("Assertion error. Not found artist for album: %s", album.Title)
			}
		}

		result[i] = MergableAlbum{
			Album:  album,
			Artist: artistPtr,
		}
	}

	return result, nil
}

func (u MergeAlbums) Exec(
	ctx context.Context,
	donorAlbumID uuid.UUID, recipientAlbumID uuid.UUID,
) error {
	donorAlbumInfo, recipientAlbumInfo, err :=
		u.getMergableAlbums(ctx, donorAlbumID, recipientAlbumID)
	if err != nil {
		return err
	}

	tx, err := u.sqlxClient.BeginTxx(ctx, &sql.TxOptions{})
	if err != nil {
		return fmt.Errorf("Can't start transaction: %w", err)
	}
	txQueries := u.queries.WithTx(tx)

	err = func() error {
		ra := recipientAlbumInfo.Album
		da := donorAlbumInfo.Album

		ra.Path = da.Path
		ra.RgPeak = da.RgPeak
		ra.RgGain = da.RgGain

		err := txQueries.UpdateAlbum(ctx, ra)
		if err != nil {
			return fmt.Errorf("Unable to update album: %w", err)
		}

		for i := range recipientAlbumInfo.Tracks {
			rt := recipientAlbumInfo.Tracks[i]
			dt := donorAlbumInfo.Tracks[i]

			rt.Path = dt.Path
			rt.RgPeak = dt.RgPeak
			rt.RgGain = dt.RgGain

			err = txQueries.UpdateTrack(ctx, rt)
			if err != nil {
				return fmt.Errorf("Unable to update track: %w", err)
			}
		}

		err = txQueries.DeleteDraftAlbumByID(ctx, donorAlbumID)
		if err != nil {
			return fmt.Errorf("Unable to delete donor album: %w", err)
		}

		return nil
	}()

	if err != nil {
		tx.Rollback()
		return err
	} else if err = tx.Commit(); err != nil {
		return fmt.Errorf("Unable to commit transaction: %w", err)
	} else {
		return nil
	}
}
