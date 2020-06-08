// Code generated by qtc from "draft-album-details.qtpl". DO NOT EDIT.
// See https://github.com/valyala/quicktemplate for details.

//line draft-album-details.qtpl:1
package views

//line draft-album-details.qtpl:1
import (
	qtio422016 "io"

	qt422016 "github.com/valyala/quicktemplate"
)

//line draft-album-details.qtpl:1
var (
	_ = qtio422016.Copy
	_ = qt422016.AcquireByteBuffer
)

//line draft-album-details.qtpl:2
type AlbumData interface {
	Path() string
	Artist() StrDatalistInputData
	Title() StrInputData
	Type() SelectInputData
	DownloadSource() SelectInputData
	SourceURL() StrInputData
	Barcode() StrInputData
	Comment() StrInputData
	Year() IntInputData
	ReleaseYear() IntInputData
}

type TrackData interface {
	Path() string
	TrackArtist() StrInputData
	Title() StrInputData
	Disc() IntInputData
	TrackNum() IntInputData
}

type CoverData interface {
	Filename() string
	URL() string
	Sort() IntInputData
	Type() SelectInputData
	Delete() CheckboxInputData
}

type DraftAlbumDetailsPage struct {
	Error  error
	Album  AlbumData
	Tracks []TrackData
	Covers []CoverData
}

//line draft-album-details.qtpl:39
func (p *DraftAlbumDetailsPage) StreamTitle(qw422016 *qt422016.Writer) {
//line draft-album-details.qtpl:39
	qw422016.N().S(`
    Draft albums
`)
//line draft-album-details.qtpl:41
}

//line draft-album-details.qtpl:41
func (p *DraftAlbumDetailsPage) WriteTitle(qq422016 qtio422016.Writer) {
//line draft-album-details.qtpl:41
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:41
	p.StreamTitle(qw422016)
//line draft-album-details.qtpl:41
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:41
}

//line draft-album-details.qtpl:41
func (p *DraftAlbumDetailsPage) Title() string {
//line draft-album-details.qtpl:41
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:41
	p.WriteTitle(qb422016)
//line draft-album-details.qtpl:41
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:41
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:41
	return qs422016
//line draft-album-details.qtpl:41
}

//line draft-album-details.qtpl:43
func (p *DraftAlbumDetailsPage) StreamBody(qw422016 *qt422016.Writer) {
//line draft-album-details.qtpl:43
	qw422016.N().S(`
    <style>
        .cover-filename {
            word-break: break-all;
        }
    </style>
    <form id="draft-album-detail-form" class="container" method="POST" enctype="multipart/form-data">
        `)
//line draft-album-details.qtpl:50
	if p.Error != nil {
//line draft-album-details.qtpl:50
		qw422016.N().S(`
        <div class="card-panel red white-text" id="error">
            `)
//line draft-album-details.qtpl:52
		qw422016.E().S(p.Error.Error())
//line draft-album-details.qtpl:52
		qw422016.N().S(`
        </div>
        `)
//line draft-album-details.qtpl:54
	}
//line draft-album-details.qtpl:54
	qw422016.N().S(`
        <div class="card">
            <div class="row">
                `)
//line draft-album-details.qtpl:58
	streammakeStrDatalistInput(qw422016, strDatalistInputConfig{
		wraperClass: "col s6",
		label:       "Artist",
		required:    true,

		data: p.Album.Artist(),
	})
//line draft-album-details.qtpl:65
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:68
	streammakeStrInput(qw422016, strInputConfig{
		wraperClass: "col s6",
		label:       "Title",
		required:    true,

		data: p.Album.Title(),
	})
//line draft-album-details.qtpl:75
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:78
	streammakeStrInput(qw422016, strInputConfig{
		wraperClass: "col s6",
		disabled:    true,
		label:       "Path",

		data: StrInputData{
			Value: p.Album.Path(),
		},
	})
//line draft-album-details.qtpl:87
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:90
	streammakeIntInput(qw422016, intInputConfig{
		wraperClass: "col s6",
		label:       "Year",
		required:    true,

		data: p.Album.Year(),
		min:  takeIntPtr(1990),
	})
//line draft-album-details.qtpl:98
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:101
	streammakeIntInput(qw422016, intInputConfig{
		wraperClass: "col s6",
		label:       "Release year",

		data: p.Album.ReleaseYear(),
		min:  takeIntPtr(1990),
	})
//line draft-album-details.qtpl:108
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:111
	streammakeSelect(qw422016, selectConfig{
		wraperClass: "col s6",
		label:       "Type",
		required:    true,

		data: p.Album.Type(),
	})
//line draft-album-details.qtpl:118
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:121
	streammakeSelect(qw422016, selectConfig{
		wraperClass: "col s6",
		label:       "Download source",
		required:    true,

		data: p.Album.DownloadSource(),
	})
//line draft-album-details.qtpl:128
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:131
	streammakeStrInput(qw422016, strInputConfig{
		wraperClass: "col s6",
		label:       "Source url",

		data: p.Album.SourceURL(),
	})
//line draft-album-details.qtpl:137
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:140
	streammakeStrInput(qw422016, strInputConfig{
		wraperClass: "col s6",
		label:       "Barcode",

		data: p.Album.Barcode(),
	})
//line draft-album-details.qtpl:146
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:149
	streammakeStrInput(qw422016, strInputConfig{
		wraperClass: "col s6",
		label:       "Comment",

		data: p.Album.Comment(),
	})
//line draft-album-details.qtpl:155
	qw422016.N().S(`
            </div>
        </div>

        <div class="card">
            <table>
                <!--thead>
                    <tr>
                        <th>Path</th>
                        <th>Title</th>
                        <th></th>
                    </tr>
                </thead-->

                <tbody>
                    `)
//line draft-album-details.qtpl:170
	for _, t := range p.Tracks {
//line draft-album-details.qtpl:170
		qw422016.N().S(`
                    <tr>
                        <th>
                            `)
//line draft-album-details.qtpl:174
		streammakeStrInput(qw422016, strInputConfig{
			label:    "Path",
			disabled: true,

			data: StrInputData{
				Value: t.Path(),
			},
		})
//line draft-album-details.qtpl:182
		qw422016.N().S(`
                        </th>
                        <td>
                            `)
//line draft-album-details.qtpl:186
		streammakeStrInput(qw422016, strInputConfig{
			label:    "Title",
			required: true,

			data: t.Title(),
		})
//line draft-album-details.qtpl:192
		qw422016.N().S(`
                        </td>
                        <td>
                            `)
//line draft-album-details.qtpl:196
		streammakeIntInput(qw422016, intInputConfig{
			label:    "Track number",
			required: true,

			min:  takeIntPtr(0),
			data: t.TrackNum(),
		})
//line draft-album-details.qtpl:203
		qw422016.N().S(`
                        </td>
                        <td>
                            `)
//line draft-album-details.qtpl:207
		streammakeIntInput(qw422016, intInputConfig{
			label:    "Disc number",
			required: true,

			min:  takeIntPtr(1),
			data: t.Disc(),
		})
//line draft-album-details.qtpl:214
		qw422016.N().S(`
                        </td>
                        <td>
                            `)
//line draft-album-details.qtpl:218
		streammakeStrInput(qw422016, strInputConfig{
			label: "TrackArtist",

			data: t.TrackArtist(),
		})
//line draft-album-details.qtpl:223
		qw422016.N().S(`
                        </td>
                    </tr>
                    `)
//line draft-album-details.qtpl:226
	}
//line draft-album-details.qtpl:226
	qw422016.N().S(`
                </tbody>
            </table>
        </div>

        <div class="card">
            <div class="row">
            `)
//line draft-album-details.qtpl:233
	for i, c := range p.Covers {
//line draft-album-details.qtpl:233
		qw422016.N().S(`
                `)
//line draft-album-details.qtpl:234
		if i%2 == 0 {
//line draft-album-details.qtpl:234
			qw422016.N().S(`
                <div class="clearfix"></div>
                `)
//line draft-album-details.qtpl:236
		}
//line draft-album-details.qtpl:236
		qw422016.N().S(`
                <div class ="col s6">
                    <div class="row">
                        <div class="col s6">
                            <img class="materialboxed responsive-img" src="`)
//line draft-album-details.qtpl:240
		qw422016.E().S(c.URL())
//line draft-album-details.qtpl:240
		qw422016.N().S(`" />
                        </div>

                        <div class="col s6">
                            <div class="row">
                                <div class="col s12">
                                    <h4 class="cover-filename">`)
//line draft-album-details.qtpl:246
		qw422016.E().S(c.Filename())
//line draft-album-details.qtpl:246
		qw422016.N().S(`</h4>
                                </div>

                                <div class="col s6">
                                    `)
//line draft-album-details.qtpl:251
		streammakeSelect(qw422016, selectConfig{
			label: "Cover type",

			data: c.Type(),
		})
//line draft-album-details.qtpl:256
		qw422016.N().S(`
                                </div>

                                <div class="col s6">
                                    `)
//line draft-album-details.qtpl:261
		streammakeIntInput(qw422016, intInputConfig{
			label:    "Sort",
			required: true,
			min:      takeIntPtr(1),

			data: c.Sort(),
		})
//line draft-album-details.qtpl:268
		qw422016.N().S(`
                                </div>

                                <div class="col s12">
                                    <label>
                                        <input
                                            type="checkbox"
                                            name="`)
//line draft-album-details.qtpl:275
		qw422016.E().S(c.Delete().Name)
//line draft-album-details.qtpl:275
		qw422016.N().S(`"
                                            value="`)
//line draft-album-details.qtpl:276
		qw422016.E().S(c.Delete().Value)
//line draft-album-details.qtpl:276
		qw422016.N().S(`"
                                        />
                                        <span>Delete</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `)
//line draft-album-details.qtpl:285
	}
//line draft-album-details.qtpl:285
	qw422016.N().S(`
            </div>
        </div>

        <div class="card" id="covers">
            <div class="row">
                <div class="col s12">
                    <div class="file-field input-field">
                        <div class="btn">
                            <span>Upload files</span>
                            <input
                                type="file"
                                name="covers"
                                accept="image/jpeg, image/png"
                                multiple
                            >
                        </div>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="row" id="footer">
            <div class="col s6">
                <button
                    class="btn waves-effect waves-light red"
                    type="submit"
                    name="delete"
                    formnovalidate
                >
                    Delete
                    <i class="material-delete right"></i>
                </button>
            </div>

            <div class="col s3 right-align">
                <button
                    class="btn waves-effect waves-light"
                    type="submit"
                    name="commit"
                >
                    Commit
                    <i class="material-icons right"></i>
                </button>
            </div>

            <div class="col s3 right-align">
                <button class="btn waves-effect waves-light" type="submit" formnovalidate>
                    Save
                    <i class="material-icons right"></i>
                </button>
            </div>
        </footer>
    </form>
`)
//line draft-album-details.qtpl:342
}

//line draft-album-details.qtpl:342
func (p *DraftAlbumDetailsPage) WriteBody(qq422016 qtio422016.Writer) {
//line draft-album-details.qtpl:342
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:342
	p.StreamBody(qw422016)
//line draft-album-details.qtpl:342
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:342
}

//line draft-album-details.qtpl:342
func (p *DraftAlbumDetailsPage) Body() string {
//line draft-album-details.qtpl:342
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:342
	p.WriteBody(qb422016)
//line draft-album-details.qtpl:342
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:342
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:342
	return qs422016
//line draft-album-details.qtpl:342
}
