package server

import (
	"fmt"
	"net/http"
	"strings"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/usecases"
	"github.com/rapthead/musiclib/views"
)

func MakeRoutes(d deps.Deps) http.Handler {
	r := chi.NewRouter()

	r.Use(middleware.Logger)
	r.Use(middleware.RedirectSlashes)

	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		http.Redirect(w, r, "/album", http.StatusSeeOther)
	})

	albumListHandler := makeAlbumListHandler(d)
	r.Get("/album", albumListHandler)

	albumDetailsHandler := makeAlbumDetailsHandler(d)
	r.Get("/album/{albumID}", func(w http.ResponseWriter, r *http.Request) {
		albumDetailsHandler(chi.URLParam(r, "albumID"), w, r)
	})

	albumUpdateHandler := makeAlbumUpdateHandler(d)
	r.Post("/album/{albumID}", func(w http.ResponseWriter, r *http.Request) {
		albumID := chi.URLParam(r, "albumID")
		albumUpdateHandler(
			AlbumUpdateParams{
				albumIDStr:          albumID,
				onDeleteRedirectTo:  "/album/",
				onSuccessRedirectTo: "/album/" + albumID,
			},
			w, r,
		)
	})

	listMergableHandler := makeListMergableHandler(d)
	r.Get("/album/{recepientID}/merge", func(w http.ResponseWriter, r *http.Request) {
		recepientIDStr := chi.URLParam(r, "recepientID")
		listMergableHandler(recepientIDStr, w, r)
	})

	mergeHandler := makeMergeHandler(d)
	r.Post("/album/{recepientID}/merge/{donorID}", func(w http.ResponseWriter, r *http.Request) {
		donorIDStr := chi.URLParam(r, "donorID")
		recepientIDStr := chi.URLParam(r, "recepientID")
		deleteOld := r.PostForm.Get("delete-old") != ""
		mergeHandler(donorIDStr, recepientIDStr, deleteOld, w, r)
	})

	mergePreviewHandler := makeMergePreviewHandler(d)
	r.Get("/album/{recepientID}/merge/{donorID}", func(w http.ResponseWriter, r *http.Request) {
		donorIDStr := chi.URLParam(r, "donorID")
		recepientIDStr := chi.URLParam(r, "recepientID")
		mergePreviewHandler(donorIDStr, recepientIDStr, w, r)
	})

	coverHandler := makeCoverHandler(d)
	r.Get("/cover/{coverID}", func(w http.ResponseWriter, r *http.Request) {
		coverIDStr := chi.URLParam(r, "coverID")
		coverHandler(coverIDStr, w, r)
	})

	r.Get("/sync", func(w http.ResponseWriter, r *http.Request) {
		p := &views.SSEPage{
			PageTitle: "Sync",
			SSEUrl:    "/sync/sse",
		}
		views.WritePageTemplate(w, p)
	})

	r.Get("/sync/sse", func(w http.ResponseWriter, r *http.Request) {
		logChan := usecases.Refresh(d, r.Context())
		EventStreamHandler(logChan, w, r)
	})

	r.Get("/rescan", func(w http.ResponseWriter, r *http.Request) {
		p := &views.SSEPage{
			PageTitle: "Rescan",
			SSEUrl:    "/rescan/sse",
		}
		views.WritePageTemplate(w, p)
	})

	r.Get("/rescan/sse", func(w http.ResponseWriter, r *http.Request) {
		logChan := usecases.Rescan(d, r.Context())
		EventStreamHandler(logChan, w, r)
	})

	return r
}

func EventStreamHandler(
	logChan <-chan usecases.LogEvent,
	w http.ResponseWriter, r *http.Request,
) {
	w.Header().Set("Content-Type", "text/event-stream")
	w.Header().Set("Cache-Control", "no-cache")
	w.Header().Set("Connection", "keep-alive")
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.WriteHeader(200)

	doFlush := func() {}
	if f, ok := w.(http.Flusher); ok {
		doFlush = f.Flush
	}

	sendEvent := func(event string, data string) {
		fmt.Fprintf(w, "event: %s\ndata: %s\n\n", event, strings.Replace(data, "\n", "\\n", -1))
		doFlush()
	}

	for logEvent := range logChan {
		info, err := logEvent.Info(), logEvent.Err()
		if err != nil {
			sendEvent("error", err.Error())
		} else {
			sendEvent("info", info)
		}
	}

	fmt.Fprint(w, "retry: 15000\nevent: end\ndata:\n\n")
	doFlush()
}

func showError(w http.ResponseWriter, err error, code int) {
	p := &views.ErrorPage{
		Error: err,
	}
	w.WriteHeader(code)
	views.WritePageTemplate(w, p)
}
