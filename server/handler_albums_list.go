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
type draftAlbumViewData struct {
	model *models.DraftAlbum
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

func (r draftAlbumViewData) URL() string {
	return "/draft/" + r.model.ID.String()
}

func makeDraftListHandler(d deps.Deps) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		draftAlbums, err := usecases.ListDraftAlbums(d, r.Context())
		if err != nil {
			showError(w, fmt.Errorf("fail to fetch draft albums: %w", err), http.StatusInternalServerError)
			return
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
	return r.artist.Name
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
				artist: &listItems[i].Artist,
			}
		}

		p := &views.AlbumsPage{
			Rows: viewRows,
		}
		views.WritePageTemplate(w, p)
	}
}
