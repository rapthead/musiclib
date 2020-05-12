package usecases

import (
	"context"
	"database/sql"
	"log"

	"github.com/rapthead/musiclib/persistance"
)

type UpdateAlbumDeps interface {
	SQLClient() sql.DB
	Queries() persistance.Queries
}

type UpdateAlbumParams struct {
	Album  persistance.UpdateAlbumParams
	Tracks []persistance.UpdateTrackParams
}

func UpdateAlbum(deps UpdateAlbumDeps, ctx context.Context, params UpdateAlbumParams) {
	sqlClient := deps.SQLClient()
	queries := deps.Queries()

	tx, err := sqlClient.Begin()
	if err != nil {
		log.Fatal("Can't start transaction", err)
	}

	txQueries := queries.WithTx(tx)
	err = txQueries.UpdateAlbum(ctx, params.Album)
	if err != nil {
		log.Fatal("Unable to update album:", err)
	}

	for _, updateTrackParams := range params.Tracks {
		err = txQueries.UpdateTrack(ctx, updateTrackParams)
		if err != nil {
			log.Fatal("Unable to update track:", err)
		}
	}
	tx.Commit()
}
