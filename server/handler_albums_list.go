package server

import (
	"fmt"
	"net/http"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/usecases"
	"github.com/rapthead/musiclib/views"
)

// draft album to view data mapper
type albumViewData struct {
	album  *models.Album
	artist *models.Artist
}

func (r albumViewData) State() string {
	return string(r.album.State)
}

func (r albumViewData) Path() string {
	return r.album.Path
}

func (r albumViewData) Title() string {
	return r.album.Title
}

func (r albumViewData) Artist() string {
	if r.artist == nil {
		return r.album.DraftArtist
	}
	return r.artist.Name
}

func (r albumViewData) SourceURL() string {
	return r.album.SourceURL
}

func (r albumViewData) URL() string {
	return "/album/" + r.album.ID.String()
}

func makeAlbumListHandler(d deps.Deps) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		listItems, err := usecases.ListAlbums(d, r.Context())
		if err != nil {
			showError(w, fmt.Errorf("fail to list albums: %w", err), http.StatusInternalServerError)
			return
		}

		viewRows := make([]views.AlbumsRow, len(listItems), len(listItems))
		for i := range listItems {
			viewRows[i] = albumViewData{
				album:  &listItems[i].Album,
				artist: listItems[i].Artist,
			}
		}

		p := &views.AlbumsPage{
			Rows: viewRows,
		}
		views.WritePageTemplate(w, p)
	}
}
