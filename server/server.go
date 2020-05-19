package server

import (
	"fmt"
	"log"
	"net/http"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/gofrs/uuid"
	"github.com/gorilla/schema"

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

// draft track to view data mapper
type draftTrackViewData struct {
	model *models.DraftTrack
}

func (r draftTrackViewData) ID() string {
	return r.model.ID.String()
}

func (r draftTrackViewData) Path() string {
	return r.model.Path
}

func (r draftTrackViewData) Title() string {
	return r.model.Title.String
}

func (r draftTrackViewData) TrackArtist() string {
	return r.model.TrackArtist.String
}

func (r draftTrackViewData) Disc() int {
	return int(r.model.Disc.Int64)
}

func (r draftTrackViewData) TrackNum() int {
	return int(r.model.TrackNum.Int64)
}

var (
	allAlbymTypeStr      []string
	allDownloadSourceStr []string
)

func init() {
	allAlbymTypeStr = make([]string, len(models.AllAlbumTypeEnum), len(models.AllAlbumTypeEnum))
	for i, albumType := range models.AllAlbumTypeEnum {
		allAlbymTypeStr[i] = string(albumType)
	}

	allDownloadSourceStr = make([]string, len(models.AllDownloadSourceEnum), len(models.AllDownloadSourceEnum))
	for i, downloadSource := range models.AllDownloadSourceEnum {
		allDownloadSourceStr[i] = string(downloadSource)
	}
}

func MakeRoutes(d deps.Deps) http.Handler {
	r := chi.NewRouter()

	r.Use(middleware.Logger)
	r.Use(middleware.RedirectSlashes)
	r.Get("/draft", func(w http.ResponseWriter, r *http.Request) {
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
	})

	r.Get("/draft/{albumID}", func(w http.ResponseWriter, r *http.Request) {
		draftAlbumIDStr := chi.URLParam(r, "albumID")
		draftAlbumID, err := uuid.FromString(draftAlbumIDStr)
		if err != nil {
			http.Error(w, "unable to parse draft album id in url", http.StatusBadRequest)
			return
		}
		fmt.Println(draftAlbumIDStr, draftAlbumID)

		draftAlbumDetails, err := usecases.GetDraftAlbumDetails(d, r.Context(), draftAlbumID)
		if err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}

		draftTrackVD := make(
			[]views.TrackData,
			len(draftAlbumDetails.DraftTracks),
			len(draftAlbumDetails.DraftTracks),
		)
		for i := range draftAlbumDetails.DraftTracks {
			draftTrackVD[i] = draftTrackViewData{&draftAlbumDetails.DraftTracks[i]}
		}

		p := &views.DraftAlbumDetailsPage{
			AllDownloadSources: allDownloadSourceStr,
			AllAlbumTypes:      allAlbymTypeStr,
			Album:              draftAlbumViewData{&draftAlbumDetails.DraftAlbum},
			Tracks:             draftTrackVD,
		}
		views.WritePageTemplate(w, p)
	})

	r.Post("/draft/{albumID}", func(w http.ResponseWriter, r *http.Request) {
		err := r.ParseMultipartForm(1024 * 1024)
		if err != nil {
			http.Error(w, fmt.Sprintln("unable to parse data", err), http.StatusBadRequest)
			return
		}

		decoder := schema.NewDecoder()

		updateDraftAlbumParams := usecases.UpdateDraftAlbumParams{}
		err = decoder.Decode(&updateDraftAlbumParams, r.PostForm)
		if err != nil {
			fmt.Printf("%v\n", err)
			http.Error(w, fmt.Sprintln("unable to decode form data", err), http.StatusBadRequest)
			return
		}

		fmt.Println(updateDraftAlbumParams)
		usecases.UpdateDraftAlbum(
			d, r.Context(), updateDraftAlbumParams,
		)
		http.Error(w, "", http.StatusNoContent)
	})

	return r
}
