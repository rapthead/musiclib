package server

import (
	"io"
	"log"
	"net/http"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/deps"
)

func makeCoverHandler(d deps.Deps) func(string, http.ResponseWriter, *http.Request) {
	coversStorage := d.CoversStorage()
	return func(coverIDStr string, w http.ResponseWriter, r *http.Request) {
		coverID, err := uuid.FromString(coverIDStr)
		if err != nil {
			http.Error(w, "unable to parse cover id in url", http.StatusBadRequest)
			return
		}

		mime, reader, err := coversStorage.Get(coverID)
		if err != nil {
			http.Error(w, "unable to get cover from store", http.StatusBadRequest)
			return
		}
		defer reader.Close()
		w.Header().Add("Content-Type", mime)

		_, err = io.Copy(w, reader)
		if err != nil {
			log.Println("error in streaming image to client:", err)
		}
	}
}

func makeThumbnailHandler(d deps.Deps) func(string, http.ResponseWriter, *http.Request) {
	thumbnailStorage := d.ThumbnailStorage()
	return func(coverIDStr string, w http.ResponseWriter, r *http.Request) {
		coverID, err := uuid.FromString(coverIDStr)
		if err != nil {
			http.Error(w, "unable to parse cover id in url", http.StatusBadRequest)
			return
		}

		mime, content, err := thumbnailStorage.Get(r.Context(), coverID, 300, 300)
		if err != nil {
			http.Error(w, "unable to get thumbnail from store: "+err.Error(), http.StatusBadRequest)
			return
		}
		w.Header().Add("Content-Type", mime)
		w.Write(content)
	}
}
