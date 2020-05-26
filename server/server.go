package server

import (
	"net/http"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/models"
)

// draft album to view data mapper
type draftAlbumViewData struct {
	model *models.DraftAlbum
}

func (r draftAlbumViewData) ID() string {
	return r.model.ID.String()
}

func (r draftAlbumViewData) Path() string {
	return r.model.Path
}

func (r draftAlbumViewData) Title() string {
	return r.model.Title.String
}

func (r draftAlbumViewData) Artist() string {
	return r.model.Artist.String
}

func (r draftAlbumViewData) Type() string {
	return string(r.model.Type)
}

func (r draftAlbumViewData) DownloadSource() string {
	return string(r.model.DownloadSource)
}

func (r draftAlbumViewData) SourceID() string {
	return r.model.SourceID.String
}

func (r draftAlbumViewData) Year() *int {
	if r.model.Year.IsZero() {
		return nil
	} else {
		year := int(r.model.Year.Int64)
		return &year
	}
}

func (r draftAlbumViewData) ReleaseYear() *int {
	if r.model.ReleaseYear.IsZero() {
		return nil
	} else {
		year := int(r.model.ReleaseYear.Int64)
		return &year
	}
}

func (r draftAlbumViewData) URL() string {
	return "/draft/" + r.model.ID.String()
}

func MakeRoutes(d deps.Deps) http.Handler {
	r := chi.NewRouter()

	r.Use(middleware.Logger)
	r.Use(middleware.RedirectSlashes)

	draftListHandler := makeDraftListHandler(d)
	r.Get("/draft", draftListHandler)

	draftDetailsHandler := makeDraftDetailsHandler(d)
	r.Get("/draft/{albumID}", func(w http.ResponseWriter, r *http.Request) {
		draftDetailsHandler(chi.URLParam(r, "albumID"), w, r)
	})

	draftUpdateHandler := makeDraftUpdateHandler(d)
	r.Post("/draft/{albumID}", func(w http.ResponseWriter, r *http.Request) {
		albumID := chi.URLParam(r, "albumID")
		draftUpdateHandler(
			draftUpdateParams{
				albumIDStr:          albumID,
				onSuccessRedirectTo: "/draft/" + albumID,
			},
			w, r,
		)
	})

	coverHandler := makeCoverHandler(d)
	r.Get("/cover/{coverID}", func(w http.ResponseWriter, r *http.Request) {
		coverIDStr := chi.URLParam(r, "coverID")
		coverHandler(coverIDStr, w, r)
	})

	return r
}
