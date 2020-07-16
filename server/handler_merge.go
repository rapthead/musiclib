package server

import (
	"errors"
	"net/http"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/usecases"
	"github.com/rapthead/musiclib/views"
)

// merge preview handler factory
func makeMergePreviewHandler(d deps.Deps) func(string, string, http.ResponseWriter, *http.Request) {
	mergeCase := usecases.NewMergeAlbums(d)
	return func(
		donorAlbumIDStr string, recepientAlbumIDStr string,
		w http.ResponseWriter, r *http.Request,
	) {
		donorAlbumID, err := uuid.FromString(donorAlbumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse donor id param"), http.StatusBadRequest)
			return
		}

		recipientAlbumID, err := uuid.FromString(recepientAlbumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse recepient id param"), http.StatusBadRequest)
			return
		}

		albumDetails, err := mergeCase.Preview(
			r.Context(), donorAlbumID, recipientAlbumID,
		)
		if err != nil {
			showError(w, err, http.StatusBadRequest)
			return
		}

		p := &views.MergeAlbumsPage{
			RecipientFilePaths: albumDetails.RecipientFilePaths,
			DonorFilePaths:     albumDetails.DonorFilePaths,
		}
		views.WritePageTemplate(w, p)
	}
}

type mergableAlbumViewData struct {
	album            *models.Album
	artist           *models.Artist
	recipientAlbumID uuid.UUID
}

func (r mergableAlbumViewData) State() string {
	return string(r.album.State)
}

func (r mergableAlbumViewData) Path() string {
	return r.album.Path
}

func (r mergableAlbumViewData) Title() string {
	return r.album.Title
}

func (r mergableAlbumViewData) Artist() string {
	if r.artist == nil {
		return r.album.DraftArtist
	}
	return r.artist.Name
}

func (r mergableAlbumViewData) URL() string {
	return "/album/" + r.recipientAlbumID.String() + "/merge/" + r.album.ID.String()
}

// merge preview handler factory
func makeListMergableHandler(d deps.Deps) func(string, http.ResponseWriter, *http.Request) {
	mergeCase := usecases.NewMergeAlbums(d)
	return func(
		recepientAlbumIDStr string,
		w http.ResponseWriter, r *http.Request,
	) {
		recipientAlbumID, err := uuid.FromString(recepientAlbumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse recepient id param"), http.StatusBadRequest)
			return
		}

		listItems, err := mergeCase.ListMergable(
			r.Context(), recipientAlbumID,
		)
		if err != nil {
			showError(w, err, http.StatusBadRequest)
			return
		}

		viewRows := make([]views.AlbumsRow, len(listItems), len(listItems))
		for i := range listItems {
			viewRows[i] = mergableAlbumViewData{
				album:            &listItems[i].Album,
				artist:           listItems[i].Artist,
				recipientAlbumID: recipientAlbumID,
			}
		}

		p := &views.AlbumsPage{
			Rows: viewRows,
		}
		views.WritePageTemplate(w, p)
	}
}

// merge preview handler factory
func makeMergeHandler(d deps.Deps) func(string, string, http.ResponseWriter, *http.Request) {
	mergeCase := usecases.NewMergeAlbums(d)
	return func(
		donorAlbumIDStr string, recipientAlbumIDStr string,
		w http.ResponseWriter, r *http.Request,
	) {
		donorAlbumID, err := uuid.FromString(donorAlbumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse donor id param"), http.StatusBadRequest)
			return
		}

		recipientAlbumID, err := uuid.FromString(recipientAlbumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse recepient id param"), http.StatusBadRequest)
			return
		}

		err = mergeCase.Exec(
			r.Context(), donorAlbumID, recipientAlbumID,
		)
		if err != nil {
			showError(w, err, http.StatusBadRequest)
			return
		}

		http.Redirect(w, r, "/album/"+recipientAlbumID.String(), http.StatusSeeOther)
		// TODO: redirect
	}
}
