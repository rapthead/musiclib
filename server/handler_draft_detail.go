package server

import (
	"errors"
	"fmt"
	"net/http"
	"net/url"
	"strconv"

	"github.com/gofrs/uuid"
	"github.com/guregu/null/zero"
	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/usecases"
	"github.com/rapthead/musiclib/views"
)

// draft album to view data mapper
type DraftAlbumForm struct {
	Model      *models.DraftAlbum
	AllArtists []models.Artist
}

func (r DraftAlbumForm) fieldName(fieldName string) string {
	return "album." + r.Model.ID.String() + "." + fieldName
}

func (r DraftAlbumForm) Path() string {
	return r.Model.Path
}

func (r DraftAlbumForm) Title() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("title"),
		Value: r.Model.Title.String,
	}
}

func (r DraftAlbumForm) Artist() views.StrDatalistInputData {
	options := make([]string, len(r.AllArtists)+1, len(r.AllArtists)+1)
	for i, artist := range r.AllArtists {
		options[i+1] = artist.Name
	}
	return views.StrDatalistInputData{
		Name:    r.fieldName("artist"),
		Value:   r.Model.Artist.String,
		Options: options,
	}
}

func (r DraftAlbumForm) SourceURL() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("source_url"),
		Value: r.Model.SourceURL.String,
	}
}

func (r DraftAlbumForm) Year() views.IntInputData {
	return views.IntInputData{
		Name:  r.fieldName("year"),
		Value: r.Model.Year.Ptr(),
	}
}

func (r DraftAlbumForm) ReleaseYear() views.IntInputData {
	return views.IntInputData{
		Name:  r.fieldName("release_year"),
		Value: r.Model.ReleaseYear.Ptr(),
	}
}

func (r DraftAlbumForm) Type() views.SelectInputData {
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

func (r DraftAlbumForm) DownloadSource() views.SelectInputData {
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

func (r DraftAlbumForm) Merge(v values) error {
	albumType := models.AlbumTypeEnum(v.Get(r.fieldName("type")))
	if !albumType.IsValid() {
		return fmt.Errorf(
			"%s has unknown album type value: %s",
			r.fieldName("album_type"), albumType,
		)
	}

	downloadSource := models.DownloadSourceEnum(v.Get(r.fieldName("download_source")))
	if !downloadSource.IsValid() {
		return fmt.Errorf(
			"%s has unknown download source value: %s",
			r.fieldName("download_source"), downloadSource,
		)
	}

	r.Model.Title = zero.StringFrom(v.Get(r.fieldName("title")))
	r.Model.Artist = zero.StringFrom(v.Get(r.fieldName("artist")))
	r.Model.SourceURL = zero.StringFrom(v.Get(r.fieldName("source_url")))
	r.Model.Year = zero.IntFrom(v.GetInt(r.fieldName("year")))
	r.Model.ReleaseYear = zero.IntFrom(v.GetInt(r.fieldName("release_year")))
	r.Model.Type = albumType
	r.Model.DownloadSource = downloadSource
	return nil
}

func newDraftAlbumData(album *models.DraftAlbum, allArtists []models.Artist) DraftAlbumForm {
	return DraftAlbumForm{album, allArtists}
}

// draft track to view data mapper
type DraftTrackForm struct {
	Model *models.DraftTrack
}

func newTracksData(tracks []models.DraftTrack) []views.TrackData {
	trackForms := make(
		[]views.TrackData,
		len(tracks),
		len(tracks),
	)
	for i := range tracks {
		trackForms[i] = DraftTrackForm{&tracks[i]}
	}
	return trackForms
}

func (r DraftTrackForm) fieldName(fieldName string) string {
	return "track." + r.Model.ID.String() + "." + fieldName
}

func (r DraftTrackForm) Path() string {
	return r.Model.Path
}

func (r DraftTrackForm) Title() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("title"),
		Value: r.Model.Title.String,
	}
}

func (r DraftTrackForm) TrackArtist() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("artist"),
		Value: r.Model.TrackArtist.String,
	}
}

func (r DraftTrackForm) Disc() views.IntInputData {
	return views.IntInputData{
		Name:  r.fieldName("disc"),
		Value: r.Model.Disc.Ptr(),
	}
}

func (r DraftTrackForm) TrackNum() views.IntInputData {
	return views.IntInputData{
		Name:  r.fieldName("track_num"),
		Value: r.Model.TrackNum.Ptr(),
	}
}

func (r DraftTrackForm) Merge(v values) error {
	r.Model.Title = zero.StringFrom(v.Get(r.fieldName("title")))
	r.Model.TrackArtist = zero.StringFrom(v.Get(r.fieldName("artist")))
	r.Model.Disc = zero.IntFrom(v.GetInt(r.fieldName("disc")))
	r.Model.TrackNum = zero.IntFrom(v.GetInt(r.fieldName("track_num")))
	return nil
}

// draft cover to view data mapper
type DraftCoverForm struct {
	Model *models.DraftCover
}

func (r DraftCoverForm) fieldName(fieldName string) string {
	return "cover." + r.Model.ID.String() + "." + fieldName
}

func (r DraftCoverForm) Filename() string {
	return r.Model.OriginalFilename
}

func (r DraftCoverForm) URL() string {
	return "/cover/" + r.Model.ID.String()
}

func (r DraftCoverForm) Type() views.SelectInputData {
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

func (r DraftCoverForm) Sort() views.IntInputData {
	return views.IntInputData{
		Name:  r.fieldName("sort"),
		Value: r.Model.Sort.Ptr(),
	}
}

func (r DraftCoverForm) Delete() views.CheckboxInputData {
	return views.CheckboxInputData{
		Name:  r.fieldName("delete"),
		Value: r.Model.ID.String(),
	}
}

func (r DraftCoverForm) IsDeleted(v values) bool {
	_, ok := v.Values[r.fieldName("delete")]
	return ok
}

func (r DraftCoverForm) Merge(v values) error {
	coverType := models.CoverTypeEnum(v.Get(r.fieldName("type")))
	if !coverType.IsValid() {
		return fmt.Errorf(
			"%s has unknown cover type value: %s",
			r.fieldName("type"), coverType,
		)
	}
	r.Model.Type = coverType
	r.Model.Sort = zero.IntFrom(v.GetInt(r.fieldName("sort")))
	return nil
}

func newCoversData(covers []models.DraftCover) []views.CoverData {
	coverForms := make(
		[]views.CoverData,
		len(covers),
		len(covers),
	)
	for i := range covers {
		coverForms[i] = DraftCoverForm{&covers[i]}
	}
	return coverForms
}

type values struct{ url.Values }

func (v values) GetInt(key string) int64 {
	strInt := v.Get(key)
	if strInt == "" {
		return 0
	}
	val, _ := strconv.ParseInt(strInt, 10, 64)
	return val
}

func makeDraftDetailsHandler(d deps.Deps) func(string, http.ResponseWriter, *http.Request) {
	return func(draftAlbumIDStr string, w http.ResponseWriter, r *http.Request) {
		draftAlbumID, err := uuid.FromString(draftAlbumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse draft album id param"), http.StatusBadRequest)
			return
		}

		draftAlbumDetails, err := usecases.GetDraftAlbumDetails(d, r.Context(), draftAlbumID)
		if err != nil {
			showError(w, err, http.StatusBadRequest)
			return
		}

		p := &views.DraftAlbumDetailsPage{
			Album:  newDraftAlbumData(&draftAlbumDetails.DraftAlbum, draftAlbumDetails.AllArtists),
			Tracks: newTracksData(draftAlbumDetails.DraftTracks),
			Covers: newCoversData(draftAlbumDetails.DraftCovers),
		}
		views.WritePageTemplate(w, p)
	}
}

type draftUpdateParams struct {
	albumIDStr          string
	onSuccessRedirectTo string
	onDeleteRedirectTo  string
}

func makeDraftUpdateHandler(d deps.Deps) func(p draftUpdateParams, w http.ResponseWriter, r *http.Request) {
	coversStorage := d.CoversStorage()
	return func(p draftUpdateParams, w http.ResponseWriter, r *http.Request) {
		draftAlbumID, err := uuid.FromString(p.albumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse draft album id param"), http.StatusBadRequest)
			return
		}

		draftAlbumDetails, err := usecases.GetDraftAlbumDetails(d, r.Context(), draftAlbumID)
		if err != nil {
			showError(w, err, http.StatusBadRequest)
			return
		}

		err = r.ParseMultipartForm(1024 * 1024)
		if err != nil {
			showError(w, fmt.Errorf("unable to parse data: %w", err), http.StatusBadRequest)
			return
		}
		vals := values{r.PostForm}
		_, doDelete := vals.Values["delete"]
		if doDelete {
			err := usecases.DeleteDraftAlbum(
				d, r.Context(), draftAlbumID,
			)
			if err != nil {
				showError(w, err, http.StatusInternalServerError)
				return
			}
			http.Redirect(w, r, p.onDeleteRedirectTo, http.StatusSeeOther)
		} else {
			draftAlbum := draftAlbumDetails.DraftAlbum
			draftAlbumData := newDraftAlbumData(
				&draftAlbum, draftAlbumDetails.AllArtists,
			)
			showError := func(w http.ResponseWriter, err error, code int) {
				p := &views.DraftAlbumDetailsPage{
					Error:  err,
					Album:  draftAlbumData,
					Tracks: newTracksData(draftAlbumDetails.DraftTracks),
					Covers: newCoversData(draftAlbumDetails.DraftCovers),
				}
				w.WriteHeader(code)
				views.WritePageTemplate(w, p)
			}

			err = draftAlbumData.Merge(vals)
			if err != nil {
				showError(w, fmt.Errorf("unable to merge album data: %w", err), http.StatusBadRequest)
				return
			}

			draftTracks := draftAlbumDetails.DraftTracks
			for i := range draftTracks {
				draftTrackPtr := &draftTracks[i]
				err = DraftTrackForm{draftTrackPtr}.Merge(vals)
				if err != nil {
					showError(w, fmt.Errorf("unable to merge track data: %w", err), http.StatusBadRequest)
					return
				}
			}

			var deleteCovers []uuid.UUID
			draftCovers := draftAlbumDetails.DraftCovers
			for i := range draftCovers {
				draftCoverPtr := &draftCovers[i]
				f := DraftCoverForm{draftCoverPtr}
				err = f.Merge(vals)
				if err != nil {
					showError(w, fmt.Errorf("unable to merge cover data: %w", err), http.StatusBadRequest)
					return
				}
				if f.IsDeleted(vals) {
					deleteCovers = append(deleteCovers, draftCoverPtr.ID)
				}
			}

			fhs := r.MultipartForm.File["covers"]
			newCovers := make([]models.DraftCover, len(fhs), len(fhs))
			for i, fh := range fhs {
				imageType, err := models.NewImageTypeEnum(fh.Header.Get("Content-Type"))
				if err != nil {
					wrapedErr := fmt.Errorf("file %s have wrong mime type: %w", fh.Filename, err)
					showError(w, wrapedErr, http.StatusBadRequest)
					return
				}
				cover := models.DraftCover{
					ID:               uuid.Must(uuid.NewV4()),
					OriginalFilename: fh.Filename,
					AlbumID:          draftAlbumID,
					Sort:             zero.Int{},
					Type:             models.CoverTypeEnumFrontOut,
				}

				file, err := fh.Open()
				if err != nil {
					showError(w, fmt.Errorf("unable to open uploaded cover: %w", err), http.StatusInternalServerError)
					return
				}
				err = coversStorage.Save(cover.ID, imageType, file)
				file.Close()
				if err != nil {
					wrapedErr := fmt.Errorf("cant't save cover image: %w", err)
					showError(w, wrapedErr, http.StatusInternalServerError)
					return
				}
				newCovers[i] = cover
			}

			err = usecases.UpdateDraftAlbum(
				d, r.Context(), usecases.UpdateDraftAlbumParams{
					Album:        draftAlbum,
					Tracks:       draftTracks,
					Covers:       draftCovers,
					DeleteCovers: deleteCovers,
					NewCovers:    newCovers,
				},
			)
			if err != nil {
				showError(w, err, http.StatusInternalServerError)
				return
			}

			if _, doCommit := vals.Values["commit"]; doCommit {
				err = usecases.CommitDraftAlbum(
					d, r.Context(), draftAlbumID,
				)
				if err != nil {
					showError(w, err, http.StatusInternalServerError)
					return
				}
			}

			http.Redirect(w, r, p.onSuccessRedirectTo+"#footer", http.StatusSeeOther)
		}
	}
}

func showError(w http.ResponseWriter, err error, code int) {
	p := &views.ErrorPage{
		Error: err,
	}
	w.WriteHeader(code)
	views.WritePageTemplate(w, p)
}
