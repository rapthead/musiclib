package server

import (
	"fmt"
	"net/http"
	"strings"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/usecases"
	"github.com/rapthead/musiclib/views"
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
	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		http.Redirect(w, r, "/draft", http.StatusSeeOther)
	})

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
				onDeleteRedirectTo:  "/draft/",
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

	r.Get("/sync", func(w http.ResponseWriter, r *http.Request) {
		p := &views.SyncPage{
			SSEUrl: "/sync/sse",
		}
		views.WritePageTemplate(w, p)
	})

	r.Get("/sync/sse", func(w http.ResponseWriter, r *http.Request) {
		logChan := usecases.Refresh(d, r.Context())
		EventStreamHandler(logChan, w, r)
	})

	return r
}

func EventStreamHandler(logChan <-chan string, w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/event-stream")
	w.Header().Set("Cache-Control", "no-cache")
	w.Header().Set("Connection", "keep-alive")
	w.Header().Set("Access-Control-Allow-Origin", "*")

	doFlush := func() {}
	if f, ok := w.(http.Flusher); ok {
		doFlush = f.Flush
	}

	for logLine := range logChan {
		fmt.Fprintf(w, "data: %s\n\n", strings.Replace(logLine, "\n", "\\n", -1))
		doFlush()
	}
}
