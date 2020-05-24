package usecases

import (
	"context"
	"database/sql"
	"log"

	"github.com/gofrs/uuid"
	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance"
)

type UpdateDraftAlbumDeps interface {
	SQLXClient() *sqlx.DB
	Queries() *persistance.Queries
}

type UpdateDraftAlbumParams struct {
	Album        models.DraftAlbum   `schema:"album"`
	Tracks       []models.DraftTrack `schema:"tracks"`
	Covers       []models.DraftCover `schema:"covers"`
	NewCovers    []models.DraftCover `schema:"-"`
	DeleteCovers []uuid.UUID         `schema:"-"`
}

func UpdateDraftAlbum(deps UpdateDraftAlbumDeps, ctx context.Context, params UpdateDraftAlbumParams) {
	sqlxClient := deps.SQLXClient()
	queries := deps.Queries()

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

	for _, draftTrack := range params.Tracks {
		err = txQueries.UpdateDraftTrack(ctx, draftTrack)
		if err != nil {
			log.Fatal("Unable to update track:", err)
		}
	}

	for _, draftCover := range params.Covers {
		err = txQueries.UpdateDraftCover(ctx, draftCover)
		if err != nil {
			log.Fatal("Unable to update cover:", err)
		}
	}

	for _, draftCover := range params.NewCovers {
		err = txQueries.InsertDraftCover(ctx, draftCover)
		if err != nil {
			log.Fatal("Unable to insert cover:", err)
		}
	}

	for _, coverID := range params.DeleteCovers {
		err = txQueries.DeleteDraftCover(ctx, coverID)
		if err != nil {
			log.Fatal("Unable to delete cover:", err)
		}
	}
	tx.Commit()
}
