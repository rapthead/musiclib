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

// draft album to view data mapper
type AlbumForm struct {
	Model      *models.Album
	AllArtists []models.Artist
}

func (r AlbumForm) fieldName(fieldName string) string {
	return "album." + r.Model.ID.String() + "." + fieldName
}

func (r AlbumForm) Path() string {
	return r.Model.Path
}

func (r AlbumForm) Title() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("title"),
		Value: r.Model.Title,
	}
}

func (r AlbumForm) Artist() views.StrDatalistInputData {
	options := make([]string, len(r.AllArtists)+1, len(r.AllArtists)+1)
	var value string
	for i, artist := range r.AllArtists {
		options[i+1] = artist.Name
		if artist.ID == r.Model.ArtistID {
			value = artist.Name
		}
	}
	return views.StrDatalistInputData{
		Name:    r.fieldName("artist"),
		Value:   value,
		Options: options,
	}
}

func (r AlbumForm) SourceURL() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("source_url"),
		Value: r.Model.SourceURL.String,
	}
}

func (r AlbumForm) Barcode() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("barcode"),
		Value: r.Model.Barcode.String,
	}
}

func (r AlbumForm) Comment() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("commetn"),
		Value: r.Model.Comment.String,
	}
}

func (r AlbumForm) Year() views.IntInputData {
	value := int64(r.Model.Year)
	return views.IntInputData{
		Name:  r.fieldName("year"),
		Value: &value,
	}
}

func (r AlbumForm) ReleaseYear() views.IntInputData {
	return views.IntInputData{
		Name:  r.fieldName("release_year"),
		Value: r.Model.ReleaseYear.Ptr(),
	}
}

func (r AlbumForm) Type() views.SelectInputData {
	options := make([]views.SelectOption, len(models.AllAlbumTypeEnum), len(models.AllAlbumTypeEnum))
	for i, albumType := range models.AllAlbumTypeEnum {
		options[i] = views.SelectOption{
			Label:    string(albumType),
			Value:    string(albumType),
			Selected: albumType == r.Model.Type,
		}
	}
	return views.SelectInputData{
		Name:    r.fieldName("type"),
		Options: options,
	}
}

func (r AlbumForm) DownloadSource() views.SelectInputData {
	options := make([]views.SelectOption, len(models.AllDownloadSourceEnum), len(models.AllDownloadSourceEnum))
	for i, downloadSource := range models.AllDownloadSourceEnum {
		options[i] = views.SelectOption{
			Label:    string(downloadSource),
			Value:    string(downloadSource),
			Selected: downloadSource == r.Model.DownloadSource,
		}
	}
	return views.SelectInputData{
		Name:    r.fieldName("download_source"),
		Options: options,
	}
}

func newAlbumData(album *models.Album, allArtists []models.Artist) AlbumForm {
	return AlbumForm{album, allArtists}
}

// draft track to view data mapper
type TrackForm struct {
	Model *models.Track
}

func newTracksData(tracks []models.Track) []views.TrackData {
	trackForms := make(
		[]views.TrackData,
		len(tracks),
		len(tracks),
	)
	for i := range tracks {
		trackForms[i] = TrackForm{&tracks[i]}
	}
	return trackForms
}

func (r TrackForm) fieldName(fieldName string) string {
	return "track." + r.Model.ID.String() + "." + fieldName
}

func (r TrackForm) Path() string {
	return r.Model.Path
}

func (r TrackForm) Title() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("title"),
		Value: r.Model.Title,
	}
}

func (r TrackForm) TrackArtist() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("artist"),
		Value: r.Model.TrackArtist.String,
	}
}

func (r TrackForm) Disc() views.IntInputData {
	value := int64(r.Model.Disc)
	return views.IntInputData{
		Name:  r.fieldName("disc"),
		Value: &value,
	}
}

func (r TrackForm) TrackNum() views.IntInputData {
	value := int64(r.Model.TrackNum)
	return views.IntInputData{
		Name:  r.fieldName("track_num"),
		Value: &value,
	}
}

// draft cover to view data mapper
type CoverForm struct {
	Model *models.Cover
}

func (r CoverForm) fieldName(fieldName string) string {
	return "cover." + r.Model.ID.String() + "." + fieldName
}

func (r CoverForm) Filename() string {
	return ""
}

func (r CoverForm) URL() string {
	return "/cover/" + r.Model.ID.String()
}

func (r CoverForm) Type() views.SelectInputData {
	options := make([]views.SelectOption, len(models.AllCoverTypeEnum), len(models.AllCoverTypeEnum))
	for i, coverType := range models.AllCoverTypeEnum {
		options[i] = views.SelectOption{
			Label:    string(coverType),
			Value:    string(coverType),
			Selected: coverType == r.Model.Type,
		}
	}
	return views.SelectInputData{
		Name:    r.fieldName("type"),
		Options: options,
	}
}

func (r CoverForm) Sort() views.IntInputData {
	value := int64(r.Model.Sort)
	return views.IntInputData{
		Name:  r.fieldName("sort"),
		Value: &value,
	}
}

func (r CoverForm) Delete() views.CheckboxInputData {
	return views.CheckboxInputData{
		Name:  r.fieldName("delete"),
		Value: r.Model.ID.String(),
	}
}

func (r CoverForm) IsDeleted(v values) bool {
	_, ok := v.Values[r.fieldName("delete")]
	return ok
}

func newCoversData(covers []models.Cover) []views.CoverData {
	coverForms := make(
		[]views.CoverData,
		len(covers),
		len(covers),
	)
	for i := range covers {
		coverForms[i] = CoverForm{&covers[i]}
	}
	return coverForms
}

func makeAlbumDetailsHandler(d deps.Deps) func(string, http.ResponseWriter, *http.Request) {
	return func(albumIDStr string, w http.ResponseWriter, r *http.Request) {
		albumID, err := uuid.FromString(albumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse album id param"), http.StatusBadRequest)
			return
		}

		albumDetails, err := usecases.GetAlbumDetails(d, r.Context(), albumID)
		if err != nil {
			showError(w, err, http.StatusBadRequest)
			return
		}

		p := &views.DraftAlbumDetailsPage{
			Album:  newAlbumData(&albumDetails.Album, albumDetails.AllArtists),
			Tracks: newTracksData(albumDetails.Tracks),
			Covers: newCoversData(albumDetails.Covers),
		}
		views.WritePageTemplate(w, p)
	}
}
