package server

import (
	"fmt"
	"net/http"

	"github.com/gofrs/uuid"
	"github.com/gorilla/schema"
	"github.com/guregu/null/zero"
	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/usecases"
)

type draftUpdateParams struct {
	albumID             string
	onSuccessRedirectTo string
}

func makeDraftUpdateHandler(d deps.Deps) func(p draftUpdateParams, w http.ResponseWriter, r *http.Request) {
	coversStorage := d.CoversStorage()
	return func(p draftUpdateParams, w http.ResponseWriter, r *http.Request) {
		err := r.ParseMultipartForm(1024 * 1024)
		if err != nil {
			http.Error(w, fmt.Sprintln("unable to parse data", err), http.StatusBadRequest)
			return
		}

		decoder := schema.NewDecoder()

		updateDraftAlbumParams := usecases.UpdateDraftAlbumParams{}
		updateDraftAlbumParams.DeleteCovers = make(
			[]uuid.UUID,
			len(r.PostForm["delete_covers"]),
			len(r.PostForm["delete_covers"]),
		)
		for i, deleteCoverId := range r.PostForm["delete_covers"] {
			updateDraftAlbumParams.DeleteCovers[i], err = uuid.FromString(deleteCoverId)
			if err != nil {
				http.Error(w, fmt.Sprintln("unable to parse delete_covers param", err), http.StatusBadRequest)
				return
			}
		}
		fmt.Println(updateDraftAlbumParams.DeleteCovers)
		r.PostForm.Del("delete_covers")
		r.PostForm.Del("covers")
		err = decoder.Decode(&updateDraftAlbumParams, r.PostForm)
		if err != nil {
			http.Error(w, fmt.Sprintln("unable to decode form data", err), http.StatusBadRequest)
			return
		}

		fhs := r.MultipartForm.File["covers"]
		newCovers := make(
			[]models.DraftCover,
			len(fhs),
			len(fhs),
		)
		for i, fh := range fhs {
			imageType, err := models.NewImageTypeEnum(fh.Header.Get("Content-Type"))
			if err != nil {
				wrapedErr := fmt.Errorf("file %s have wrong mime type: %w", fh.Filename, err)
				http.Error(w, wrapedErr.Error(), http.StatusBadRequest)
				return
			}
			cover := models.DraftCover{
				ID:               uuid.Must(uuid.NewV4()),
				OriginalFilename: fh.Filename,
				AlbumID:          updateDraftAlbumParams.Album.ID,
				Sort:             zero.Int{},
				Type:             models.CoverTypeEnumFrontOut,
			}
			fmt.Printf("%s-%s-%d\n", fh.Filename, imageType, fh.Size)

			file, err := fh.Open()
			if err != nil {
				http.Error(w, fmt.Sprintln("unable to open uploaded cover", err), http.StatusInternalServerError)
			}
			err = coversStorage.Save(cover.ID, imageType, file)
			file.Close()
			if err != nil {
				wrapedErr := fmt.Errorf("cant't save cover image: %w", err)
				http.Error(w, wrapedErr.Error(), http.StatusInternalServerError)
				return
			}
			newCovers[i] = cover
		}
		updateDraftAlbumParams.NewCovers = newCovers

		usecases.UpdateDraftAlbum(
			d, r.Context(), updateDraftAlbumParams,
		)

		http.Redirect(w, r, p.onSuccessRedirectTo+"#submit-button", http.StatusSeeOther)
	}
}
