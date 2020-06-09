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
	var value string
	for i, artist := range r.AllArtists {
		options[i+1] = artist.Name
		if artist.ID == r.Model.ArtistID {
			value = artist.Name
		}
	}
	return views.StrDatalistInputData{
		Name:    "artist",
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

func (r AlbumForm) State() views.SelectInputData {
	currentEnumValue := r.Model.State
	allEnumValues := models.AllAlbumStateEnum
	fieldName := r.fieldName("state")

	options := make([]views.SelectOption, len(allEnumValues), len(allEnumValues))
	for i, enumValue := range allEnumValues {
		options[i] = views.SelectOption{
			Label:    string(enumValue),
			Value:    string(enumValue),
			Selected: enumValue == currentEnumValue,
		}
	}
	return views.SelectInputData{
		Name:    fieldName,
		Options: options,
	}
}

func (r AlbumForm) Type() views.SelectInputData {
	currentEnumValue := r.Model.Type
	allEnumValues := models.AllAlbumTypeEnum
	fieldName := r.fieldName("type")

	options := make([]views.SelectOption, len(allEnumValues), len(allEnumValues))
	for i, enumValue := range allEnumValues {
		options[i] = views.SelectOption{
			Label:    string(enumValue),
			Value:    string(enumValue),
			Selected: enumValue == currentEnumValue,
		}
	}
	return views.SelectInputData{
		Name:    fieldName,
		Options: options,
	}
}

func (r AlbumForm) DownloadSource() views.SelectInputData {
	currentEnumValue := r.Model.DownloadSource
	allEnumValues := models.AllDownloadSourceEnum
	fieldName := r.fieldName("download_source")

	options := make([]views.SelectOption, len(allEnumValues), len(allEnumValues))
	for i, enumValue := range allEnumValues {
		options[i] = views.SelectOption{
			Label:    string(enumValue),
			Value:    string(enumValue),
			Selected: enumValue == currentEnumValue,
		}
	}
	return views.SelectInputData{
		Name:    fieldName,
		Options: options,
	}
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

	r.Model.Title = v.Get(r.fieldName("title"))
	r.Model.SourceURL = zero.StringFrom(v.Get(r.fieldName("source_url")))
	r.Model.Barcode = zero.StringFrom(v.Get(r.fieldName("barcode")))
	r.Model.Comment = zero.StringFrom(v.Get(r.fieldName("comment")))
	r.Model.Year = v.GetInt(r.fieldName("year"))
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

func (r TrackForm) Merge(v values) error {
	r.Model.Title = v.Get(r.fieldName("title"))
	r.Model.TrackArtist = zero.StringFrom(v.Get(r.fieldName("artist")))
	r.Model.Disc = v.GetInt(r.fieldName("disc"))
	r.Model.TrackNum = v.GetInt(r.fieldName("track_num"))
	return nil
}

//  cover to view data mapper
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
	currentEnumValue := r.Model.Type
	allEnumValues := models.AllCoverTypeEnum
	fieldName := r.fieldName("type")

	options := make([]views.SelectOption, len(allEnumValues), len(allEnumValues))
	for i, enumValue := range allEnumValues {
		options[i] = views.SelectOption{
			Label:    string(enumValue),
			Value:    string(enumValue),
			Selected: enumValue == currentEnumValue,
		}
	}
	return views.SelectInputData{
		Name:    fieldName,
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
			Album:  newAlbumData(&albumDetails.Album, albumDetails.AllArtists),
			Tracks: newTracksData(albumDetails.Tracks),
			Covers: newCoversData(albumDetails.Covers),
		}
		views.WritePageTemplate(w, p)
	}
}

type AlbumUpdateParams struct {
	albumIDStr          string
	onSuccessRedirectTo string
	onDeleteRedirectTo  string
}

func makeAlbumUpdateHandler(d deps.Deps) func(p AlbumUpdateParams, w http.ResponseWriter, r *http.Request) {
	coversStorage := d.CoversStorage()
	return func(p AlbumUpdateParams, w http.ResponseWriter, r *http.Request) {
		AlbumID, err := uuid.FromString(p.albumIDStr)
		if err != nil {
			showError(w, errors.New("unable to parse  album id param"), http.StatusBadRequest)
			return
		}

		AlbumDetails, err := usecases.GetAlbumDetails(d, r.Context(), AlbumID)
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

		Album := AlbumDetails.Album
		AlbumData := newAlbumData(
			&Album, AlbumDetails.AllArtists,
		)
		showError := func(w http.ResponseWriter, err error, code int) {
			p := &views.AlbumDetailsPage{
				Error:  err,
				Album:  AlbumData,
				Tracks: newTracksData(AlbumDetails.Tracks),
				Covers: newCoversData(AlbumDetails.Covers),
			}
			w.WriteHeader(code)
			views.WritePageTemplate(w, p)
		}

		err = AlbumData.Merge(vals)
		if err != nil {
			showError(w, fmt.Errorf("unable to merge album data: %w", err), http.StatusBadRequest)
			return
		}
		fmt.Println(AlbumData.Model.State)

		Tracks := AlbumDetails.Tracks
		for i := range Tracks {
			TrackPtr := &Tracks[i]
			err = TrackForm{TrackPtr}.Merge(vals)
			if err != nil {
				showError(w, fmt.Errorf("unable to merge track data: %w", err), http.StatusBadRequest)
				return
			}
		}

		var deleteCovers []uuid.UUID
		Covers := AlbumDetails.Covers
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
				AlbumID: AlbumID,
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

		err = usecases.UpdateAlbum(
			d, r.Context(), usecases.UpdateAlbumParams{
				Artist:       vals.Get("artist"),
				Album:        Album,
				Tracks:       Tracks,
				Covers:       Covers,
				DeleteCovers: deleteCovers,
				NewCovers:    newCovers,
			},
		)
		if err != nil {
			showError(w, err, http.StatusInternalServerError)
			return
		}

		http.Redirect(w, r, p.onSuccessRedirectTo+"#footer", http.StatusSeeOther)
	}
}
