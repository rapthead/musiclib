package server

import (
	"errors"
	"fmt"
	"net/http"

	"github.com/gofrs/uuid"
	"github.com/guregu/null/zero"
	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/usecases"
	"github.com/rapthead/musiclib/views"
)

//  album to view data mapper
type AlbumForm struct {
	Model      *models.Album
	AllArtists []models.Artist
}

func (r AlbumForm) MergeURL() string {
	return "/album/" + r.Model.ID.String() + "/merge"
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

func (r AlbumForm) TitleSuggestion() string {
	return models.TitleSuggestion(r.Model.Title)
}

func (r AlbumForm) Artist() views.StrDatalistInputData {
	options := make([]string, len(r.AllArtists)+1, len(r.AllArtists)+1)
	value := r.Model.DraftArtist

	for i, artist := range r.AllArtists {
		options[i+1] = artist.Name
		if r.Model.ArtistID.Valid && artist.ID == r.Model.ArtistID.UUID {
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
		Value: r.Model.SourceURL,
	}
}

func (r AlbumForm) Barcode() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("barcode"),
		Value: r.Model.Barcode,
	}
}

func (r AlbumForm) Comment() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("commetn"),
		Value: r.Model.Comment,
	}
}

func (r AlbumForm) Year() views.IntInputData {
	return views.IntInputData{
		Name:  r.fieldName("year"),
		Value: r.Model.Year.Ptr(),
	}
}

func (r AlbumForm) ReleaseYear() views.IntInputData {
	return views.IntInputData{
		Name:  r.fieldName("release_year"),
		Value: r.Model.ReleaseYear.Ptr(),
	}
}

func (r AlbumForm) State() views.SelectInputData {
	return r.Model.State.SelectInput(r.fieldName("state"))
}

func (r AlbumForm) IsDraft() bool {
	return r.Model.State == models.AlbumStateEnumDraft
}

func (r AlbumForm) Type() views.SelectInputData {
	return r.Model.Type.SelectInput(r.fieldName("type"))
}

func (r AlbumForm) DownloadSource() views.SelectInputData {
	return r.Model.DownloadSource.SelectInput(r.fieldName("download_source"))
}

func (r AlbumForm) Merge(v values) error {
	albumState := models.AlbumStateEnum(v.Get(r.fieldName("state")))
	if !albumState.IsValid() {
		return fmt.Errorf(
			"%s has unknown album state value: %s",
			r.fieldName("state"), albumState,
		)
	}

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

	r.Model.DraftArtist = v.Get(r.fieldName("artist"))
	r.Model.Title = v.Get(r.fieldName("title"))
	r.Model.SourceURL = v.Get(r.fieldName("source_url"))
	r.Model.Barcode = v.Get(r.fieldName("barcode"))
	r.Model.Comment = v.Get(r.fieldName("comment"))
	r.Model.Year = zero.IntFrom(v.GetInt64(r.fieldName("year")))
	r.Model.ReleaseYear = zero.IntFrom(v.GetInt64(r.fieldName("release_year")))
	r.Model.State = albumState
	r.Model.Type = albumType
	r.Model.DownloadSource = downloadSource
	return nil
}

func newAlbumData(album *models.Album, allArtists []models.Artist) AlbumForm {
	return AlbumForm{album, allArtists}
}

//  track to view data mapper
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

func (r TrackForm) TitleSuggestion() string {
	return models.TitleSuggestion(r.Model.Title)
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
		Value: r.Model.TrackArtist,
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

func (r TrackForm) Merge(v values) error {
	r.Model.Title = v.Get(r.fieldName("title"))
	r.Model.TrackArtist = v.Get(r.fieldName("artist"))
	r.Model.Disc = v.GetInt(r.fieldName("disc"))
	r.Model.TrackNum = v.GetInt(r.fieldName("track_num"))
	return nil
}

// cover to view data mapper
type CoverForm struct {
	Model *models.Cover
}

func (r CoverForm) fieldName(fieldName string) string {
	return "cover." + r.Model.ID.String() + "." + fieldName
}

func (r CoverForm) Filename() string {
	return r.Model.Filename.String
}

func (r CoverForm) URL() string {
	return "/cover/" + r.Model.ID.String()
}

func (r CoverForm) Type() views.SelectInputData {
	return r.Model.Type.SelectInput(r.fieldName("type"))
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

func (r CoverForm) Merge(v values) error {
	coverType := models.CoverTypeEnum(v.Get(r.fieldName("type")))
	if !coverType.IsValid() {
		return fmt.Errorf(
			"%s has unknown cover type value: %s",
			r.fieldName("type"), coverType,
		)
	}
	r.Model.Type = coverType
	r.Model.Sort = v.GetInt(r.fieldName("sort"))
	return nil
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

// release to view data mapper
type ReleaseForm struct {
	Model     *models.Release
	AllLabels []string
}

func (r ReleaseForm) fieldName(fieldName string) string {
	return "release." + r.Model.ID.String() + "." + fieldName
}

func (r ReleaseForm) Label() views.StrDatalistInputData {
	return views.StrDatalistInputData{
		Name:    r.fieldName("label"),
		Value:   r.Model.Label,
		Options: r.AllLabels,
	}
}

func (r ReleaseForm) CatalogNum() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("catalog_num"),
		Value: r.Model.CatalogNumber.String,
	}
}

func (r ReleaseForm) Delete() *views.CheckboxInputData {
	return &views.CheckboxInputData{
		Name:  r.fieldName("delete"),
		Value: r.Model.ID.String(),
	}
}

func (r ReleaseForm) IsDeleted(v values) bool {
	_, ok := v.Values[r.fieldName("delete")]
	return ok
}

func (r ReleaseForm) Merge(v values) error {
	r.Model.Label = v.Get(r.fieldName("label"))
	r.Model.CatalogNumber = zero.StringFrom(v.Get(r.fieldName("catalog_num")))
	return nil
}

// form to construct new release
type NewReleaseForm struct{ AllLabels []string }

func (r NewReleaseForm) fieldName(fieldName string) string {
	return "new_release." + fieldName
}

func (r NewReleaseForm) Label() views.StrDatalistInputData {
	return views.StrDatalistInputData{
		Name:    r.fieldName("label"),
		Value:   "",
		Options: r.AllLabels,
	}
}

func (r NewReleaseForm) CatalogNum() views.StrInputData {
	return views.StrInputData{
		Name:  r.fieldName("catalog_num"),
		Value: "",
	}
}

func (r NewReleaseForm) Delete() *views.CheckboxInputData {
	return nil
}

func (r NewReleaseForm) Construct(albumId uuid.UUID, v values) *models.Release {
	m := models.Release{
		ID:            uuid.Must(uuid.NewV4()),
		AlbumID:       albumId,
		Label:         v.Get(r.fieldName("label")),
		CatalogNumber: zero.StringFrom(v.Get(r.fieldName("catalog_num"))),
	}
	if m.Label != "" {
		return &m
	}
	return nil
}

func newReleaseData(releaseInfo []models.Release, allLabels []string) []views.ReleaseData {
	releaseForms := make(
		[]views.ReleaseData,
		len(releaseInfo)+1,
		len(releaseInfo)+1,
	)
	for i := range releaseInfo {
		releaseForms[i] = ReleaseForm{&releaseInfo[i], allLabels}
	}
	releaseForms[len(releaseInfo)] = NewReleaseForm{allLabels}
	return releaseForms
}

// detail album handler factory
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

		p := &views.AlbumDetailsPage{
			Album:       newAlbumData(&albumDetails.Album, albumDetails.AllArtists),
			Tracks:      newTracksData(albumDetails.Tracks),
			Covers:      newCoversData(albumDetails.Covers),
			ReleaseInfo: newReleaseData(albumDetails.ReleaseInfo, albumDetails.AllLabels),
		}
		views.WritePageTemplate(w, p)
	}
}

type AlbumUpdateParams struct {
	albumIDStr          string
	onSuccessRedirectTo string
	onDeleteRedirectTo  string
}

// album updation handler factory
func makeAlbumUpdateHandler(d deps.Deps) func(p AlbumUpdateParams, w http.ResponseWriter, r *http.Request) {
	coversStorage := d.CoversStorage()
	return func(p AlbumUpdateParams, w http.ResponseWriter, r *http.Request) {
		albumID, err := uuid.FromString(p.albumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse  album id param"), http.StatusBadRequest)
			return
		}

		albumDetails, err := usecases.GetAlbumDetails(d, r.Context(), albumID)
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
				d, r.Context(), albumID,
			)
			if err != nil {
				showError(w, err, http.StatusInternalServerError)
				return
			}
			http.Redirect(w, r, p.onDeleteRedirectTo, http.StatusSeeOther)
		} else {
			Album := albumDetails.Album
			AlbumData := newAlbumData(
				&Album, albumDetails.AllArtists,
			)
			showError := func(w http.ResponseWriter, err error, code int) {
				p := &views.AlbumDetailsPage{
					Error:       err,
					Album:       AlbumData,
					Tracks:      newTracksData(albumDetails.Tracks),
					Covers:      newCoversData(albumDetails.Covers),
					ReleaseInfo: newReleaseData(albumDetails.ReleaseInfo, albumDetails.AllLabels),
				}
				w.WriteHeader(code)
				views.WritePageTemplate(w, p)
			}

			err = AlbumData.Merge(vals)
			if err != nil {
				showError(w, fmt.Errorf("unable to merge album data: %w", err), http.StatusBadRequest)
				return
			}

			Tracks := albumDetails.Tracks
			for i := range Tracks {
				TrackPtr := &Tracks[i]
				err = TrackForm{TrackPtr}.Merge(vals)
				if err != nil {
					showError(w, fmt.Errorf("unable to merge track data: %w", err), http.StatusBadRequest)
					return
				}
			}

			var deleteCovers []uuid.UUID
			Covers := albumDetails.Covers
			for i := range Covers {
				CoverPtr := &Covers[i]
				f := CoverForm{CoverPtr}
				err = f.Merge(vals)
				if err != nil {
					showError(w, fmt.Errorf("unable to merge cover data: %w", err), http.StatusBadRequest)
					return
				}
				if f.IsDeleted(vals) {
					deleteCovers = append(deleteCovers, CoverPtr.ID)
				}
			}

			fhs := r.MultipartForm.File["covers"]
			newCovers := make([]models.Cover, len(fhs), len(fhs))
			for i, fh := range fhs {
				imageType, err := models.NewImageTypeEnum(fh.Header.Get("Content-Type"))
				if err != nil {
					wrapedErr := fmt.Errorf("file %s have wrong mime type: %w", fh.Filename, err)
					showError(w, wrapedErr, http.StatusBadRequest)
					return
				}
				cover := models.Cover{
					ID:      uuid.Must(uuid.NewV4()),
					AlbumID: albumID,
					Sort:    1,
					Type:    models.CoverTypeEnumFrontOut,
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

			var deleteReleases []uuid.UUID
			releaseInfo := albumDetails.ReleaseInfo
			for i := range releaseInfo {
				releasePtr := &releaseInfo[i]
				f := ReleaseForm{releasePtr, []string{}}
				if f.IsDeleted(vals) {
					deleteReleases = append(deleteReleases, releasePtr.ID)
				} else {
					err = f.Merge(vals)
					if err != nil {
						showError(w, fmt.Errorf("unable to merge cover data: %w", err), http.StatusBadRequest)
						return
					}
				}
			}

			err = usecases.UpdateAlbum(
				d, r.Context(), usecases.UpdateAlbumParams{
					Album:        Album,
					Tracks:       Tracks,
					Covers:       Covers,
					DeleteCovers: deleteCovers,
					NewCovers:    newCovers,

					Releases:       releaseInfo,
					DeleteReleases: deleteReleases,
					NewRelease:     NewReleaseForm{}.Construct(albumID, vals),
				},
			)
			if err != nil {
				showError(w, err, http.StatusInternalServerError)
				return
			}

			http.Redirect(w, r, p.onSuccessRedirectTo+"#footer", http.StatusSeeOther)
		}
	}
}
