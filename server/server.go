package server

import (
	"fmt"
	"log"
	"net/http"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/gofrs/uuid"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/usecases"
	"github.com/rapthead/musiclib/views"
)

// const templateGlob = "templates/data/*.html"

type draftAlbumsViewRow struct {
	model *models.DraftAlbum
}

func (r draftAlbumsViewRow) URL() string {
	return "/draft/" + r.model.ID.String()
}

func (r draftAlbumsViewRow) Path() string {
	return r.model.Path
}

func (r draftAlbumsViewRow) Title() string {
	return r.model.Title.String
}

func (r draftAlbumsViewRow) Artist() string {
	return r.model.Artist.String
}

func MakeRoutes(d deps.Deps) http.Handler {
	// conf := config.Config
	// var te templates.TemplateExecutor

	// if conf.Debug {
	// 	te = templates.DebugTemplateExecutor{
	// 		Glob: templateGlob,
	// 	}
	// } else {
	// 	te = templates.ReleaseTemplateExecutor{
	// 		Template: template.Must(template.ParseGlob(templateGlob)),
	// 	}
	// }

	r := chi.NewRouter()

	r.Use(middleware.Logger)
	r.Use(middleware.RedirectSlashes)
	r.Get("/draft", func(w http.ResponseWriter, r *http.Request) {
		draftAlbums, err := usecases.ListDraftAlbums(d, r.Context())
		if err != nil {
			log.Fatalln("fail to fetch draft albums:", err)
		}

		viewRows := make([]views.DraftAlbumsRow, len(draftAlbums), len(draftAlbums))
		for i, draftAlbum := range draftAlbums {
			viewRows[i] = draftAlbumsViewRow{&draftAlbum}
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
			http.Error(w, "unable to parse draft album id in url", 400)
			return
		}
		fmt.Println(draftAlbumIDStr, draftAlbumID)

		draftAlbumDetails, err := usecases.GetDraftAlbumDetails(d, r.Context(), draftAlbumID)
		if err != nil {
			http.Error(w, err.Error(), 400)
			return
		}

		p := &views.DraftAlbumDetailsPage{
			Album: draftAlbumsViewRow{&draftAlbumDetails.DraftAlbum},
		}
		views.WritePageTemplate(w, p)
	})

	return r
}
