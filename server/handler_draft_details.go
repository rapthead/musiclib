package server

import (
	"fmt"
	"net/http"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/usecases"
	"github.com/rapthead/musiclib/views"
)

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

func (r draftTrackViewData) Disc() *int {
	if r.model.Disc.IsZero() {
		return nil
	} else {
		val := int(r.model.Disc.Int64)
		return &val
	}
}

func (r draftTrackViewData) TrackNum() *int {
	if r.model.TrackNum.IsZero() {
		return nil
	} else {
		val := int(r.model.TrackNum.Int64)
		return &val
	}
}

// draft cover to view data mapper
type draftCoverViewData struct {
	model *models.DraftCover
}

func (r draftCoverViewData) ID() string {
	return r.model.ID.String()
}

func (r draftCoverViewData) Filename() string {
	return r.model.OriginalFilename
}

func (r draftCoverViewData) Type() string {
	return string(r.model.Type)
}

func (r draftCoverViewData) Sort() *int {
	if r.model.Sort.IsZero() {
		return nil
	} else {
		val := int(r.model.Sort.Int64)
		return &val
	}
}

func (r draftCoverViewData) URL() string {
	return "/cover/" + r.model.ID.String()
}

var (
	allCoverTypeStr      []string
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

	allCoverTypeStr = make([]string, len(models.AllCoverTypeEnum), len(models.AllCoverTypeEnum))
	for i, coverType := range models.AllCoverTypeEnum {
		allCoverTypeStr[i] = string(coverType)
	}
}

func makeDraftDetailsHandler(d deps.Deps) func(string, http.ResponseWriter, *http.Request) {
	return func(draftAlbumIDStr string, w http.ResponseWriter, r *http.Request) {
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

		draftCoverVD := make(
			[]views.CoverData,
			len(draftAlbumDetails.DraftCovers),
			len(draftAlbumDetails.DraftCovers),
		)
		for i := range draftAlbumDetails.DraftCovers {
			draftCoverVD[i] = draftCoverViewData{&draftAlbumDetails.DraftCovers[i]}
		}

		p := &views.DraftAlbumDetailsPage{
			AllDownloadSources: allDownloadSourceStr,
			AllAlbumTypes:      allAlbymTypeStr,
			AllCoverTypes:      allCoverTypeStr,

			Album:  draftAlbumViewData{&draftAlbumDetails.DraftAlbum},
			Tracks: draftTrackVD,
			Covers: draftCoverVD,
		}
		views.WritePageTemplate(w, p)
	}
}
