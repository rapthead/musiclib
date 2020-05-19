package usecases

import (
	"context"
	"database/sql"
	"log"

	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance2"
)

type UpdateDraftAlbumDeps interface {
	SQLXClient() *sqlx.DB
	Queries2() *persistance2.Queries
}

type UpdateDraftAlbumParams struct {
	Album  models.DraftAlbum
	Tracks []models.DraftTrack
}

func UpdateDraftAlbum(deps UpdateDraftAlbumDeps, ctx context.Context, params UpdateDraftAlbumParams) {
	sqlxClient := deps.SQLXClient()
	queries := deps.Queries2()

	txOptions := sql.TxOptions{}
	tx, err := sqlxClient.BeginTxx(ctx, &txOptions)
	if err != nil {
		log.Fatal("Can't start transaction", err)
	}

	txQueries := queries.WithTx(tx)
	err = txQueries.UpdateDraftAlbum(ctx, params.Album)
	if err != nil {
		log.Fatal("Unable to update album:", err)
	}

	for _, updateTrackParams := range params.Tracks {
		err = txQueries.UpdateDraftTrack(ctx, updateTrackParams)
		if err != nil {
			log.Fatal("Unable to update track:", err)
		}
	}
	tx.Commit()
}
