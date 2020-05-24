package server

import (
	"log"
	"net/http"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/usecases"
	"github.com/rapthead/musiclib/views"
)

func makeDraftListHandler(d deps.Deps) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		draftAlbums, err := usecases.ListDraftAlbums(d, r.Context())
		if err != nil {
			log.Fatalln("fail to fetch draft albums:", err)
		}

		viewRows := make([]views.DraftAlbumsRow, len(draftAlbums), len(draftAlbums))
		for i := range draftAlbums {
			viewRows[i] = draftAlbumViewData{&draftAlbums[i]}
		}

		p := &views.DraftAlbumsPage{
			Rows: viewRows,
		}
		views.WritePageTemplate(w, p)
	}
}
