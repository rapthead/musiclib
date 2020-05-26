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
	Artist() StrInputData
	Title() StrInputData
	Type() SelectInputData
	DownloadSource() SelectInputData
	SourceID() StrInputData
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

type strInputConfig struct {
	wraperClass string
	disabled    bool
	label       string

	data StrInputData
}

type intInputConfig struct {
	wraperClass string
	disabled    bool
	label       string

	min  *int64
	data IntInputData
}

type selectConfig struct {
	wraperClass string
	disabled    bool
	label       string

	data SelectInputData
}

//line draft-album-details.qtpl:62
func (p *DraftAlbumDetailsPage) StreamTitle(qw422016 *qt422016.Writer) {
//line draft-album-details.qtpl:62
	qw422016.N().S(`
    Draft albums
`)
//line draft-album-details.qtpl:64
}

//line draft-album-details.qtpl:64
func (p *DraftAlbumDetailsPage) WriteTitle(qq422016 qtio422016.Writer) {
//line draft-album-details.qtpl:64
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:64
	p.StreamTitle(qw422016)
//line draft-album-details.qtpl:64
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:64
}

//line draft-album-details.qtpl:64
func (p *DraftAlbumDetailsPage) Title() string {
//line draft-album-details.qtpl:64
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:64
	p.WriteTitle(qb422016)
//line draft-album-details.qtpl:64
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:64
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:64
	return qs422016
//line draft-album-details.qtpl:64
}

//line draft-album-details.qtpl:66
func (p *DraftAlbumDetailsPage) StreamBody(qw422016 *qt422016.Writer) {
//line draft-album-details.qtpl:66
	qw422016.N().S(`
    <style>
        .cover-filename {
            word-break: break-all;
        }
    </style>
    <form class="container" method="POST" enctype="multipart/form-data">
        `)
//line draft-album-details.qtpl:73
	if p.Error != nil {
//line draft-album-details.qtpl:73
		qw422016.N().S(`
        <div class="card-panel red white-text">
            `)
//line draft-album-details.qtpl:75
		qw422016.E().S(p.Error.Error())
//line draft-album-details.qtpl:75
		qw422016.N().S(`
        </div>
        `)
//line draft-album-details.qtpl:77
	}
//line draft-album-details.qtpl:77
	qw422016.N().S(`
        <div class="card">
            <div class="row">
                `)
//line draft-album-details.qtpl:81
	streammakeStrInput(qw422016, strInputConfig{
		wraperClass: "col s6",
		label:       "Draft artist",

		data: p.Album.Artist(),
	})
//line draft-album-details.qtpl:87
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:90
	streammakeStrInput(qw422016, strInputConfig{
		wraperClass: "col s6",
		label:       "Title",

		data: p.Album.Title(),
	})
//line draft-album-details.qtpl:96
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:99
	streammakeStrInput(qw422016, strInputConfig{
		wraperClass: "col s6",
		disabled:    true,
		label:       "Path",

		data: StrInputData{
			Value: p.Album.Path(),
		},
	})
//line draft-album-details.qtpl:108
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:111
	streammakeIntInput(qw422016, intInputConfig{
		wraperClass: "col s6",
		label:       "Year",

		data: p.Album.Year(),
		min:  takeIntPtr(1990),
	})
//line draft-album-details.qtpl:118
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:121
	streammakeIntInput(qw422016, intInputConfig{
		wraperClass: "col s6",
		label:       "Release year",

		data: p.Album.ReleaseYear(),
		min:  takeIntPtr(1990),
	})
//line draft-album-details.qtpl:128
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:131
	streammakeSelect(qw422016, selectConfig{
		wraperClass: "col s6",
		label:       "Type",

		data: p.Album.Type(),
	})
//line draft-album-details.qtpl:137
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:140
	streammakeSelect(qw422016, selectConfig{
		wraperClass: "col s6",
		label:       "Download source",

		data: p.Album.DownloadSource(),
	})
//line draft-album-details.qtpl:146
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:149
	streammakeStrInput(qw422016, strInputConfig{
		wraperClass: "col s6",
		label:       "Source id",

		data: p.Album.SourceID(),
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
			label: "Title",

			data: t.Title(),
		})
//line draft-album-details.qtpl:191
		qw422016.N().S(`
                        </td>
                        <td>
                            `)
//line draft-album-details.qtpl:195
		streammakeIntInput(qw422016, intInputConfig{
			label: "Track number",

			min:  takeIntPtr(0),
			data: t.TrackNum(),
		})
//line draft-album-details.qtpl:201
		qw422016.N().S(`
                        </td>
                        <td>
                            `)
//line draft-album-details.qtpl:205
		streammakeIntInput(qw422016, intInputConfig{
			label: "Disc number",

			min:  takeIntPtr(0),
			data: t.Disc(),
		})
//line draft-album-details.qtpl:211
		qw422016.N().S(`
                        </td>
                        <td>
                            `)
//line draft-album-details.qtpl:215
		streammakeStrInput(qw422016, strInputConfig{
			label: "TrackArtist",

			data: t.TrackArtist(),
		})
//line draft-album-details.qtpl:220
		qw422016.N().S(`
                        </td>
                    </tr>
                    `)
//line draft-album-details.qtpl:223
	}
//line draft-album-details.qtpl:223
	qw422016.N().S(`
                </tbody>
            </table>
        </div>

        <div class="card">
            <div class="row">
            `)
//line draft-album-details.qtpl:230
	for i, c := range p.Covers {
//line draft-album-details.qtpl:230
		qw422016.N().S(`
                `)
//line draft-album-details.qtpl:231
		if i%2 == 0 {
//line draft-album-details.qtpl:231
			qw422016.N().S(`
                <div class="clearfix"></div>
                `)
//line draft-album-details.qtpl:233
		}
//line draft-album-details.qtpl:233
		qw422016.N().S(`
                <div class ="col s6">
                    <div class="row">
                        <div class="col s6">
                            <img class="materialboxed responsive-img" src="`)
//line draft-album-details.qtpl:237
		qw422016.E().S(c.URL())
//line draft-album-details.qtpl:237
		qw422016.N().S(`" />
                        </div>

                        <div class="col s6">
                            <div class="row">
                                <div class="col s12">
                                    <h4 class="cover-filename">`)
//line draft-album-details.qtpl:243
		qw422016.E().S(c.Filename())
//line draft-album-details.qtpl:243
		qw422016.N().S(`</h4>
                                </div>

                                <div class="col s6">
                                    `)
//line draft-album-details.qtpl:248
		streammakeSelect(qw422016, selectConfig{
			label: "Cover type",

			data: c.Type(),
		})
//line draft-album-details.qtpl:253
		qw422016.N().S(`
                                </div>

                                <div class="col s6">
                                    `)
//line draft-album-details.qtpl:258
		streammakeIntInput(qw422016, intInputConfig{
			label: "Sort",

			data: c.Sort(),
		})
//line draft-album-details.qtpl:263
		qw422016.N().S(`
                                </div>

                                <div class="col s12">
                                    <label>
                                        <input
                                            type="checkbox"
                                            name="`)
//line draft-album-details.qtpl:270
		qw422016.E().S(c.Delete().Name)
//line draft-album-details.qtpl:270
		qw422016.N().S(`"
                                            value="`)
//line draft-album-details.qtpl:271
		qw422016.E().S(c.Delete().Value)
//line draft-album-details.qtpl:271
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
//line draft-album-details.qtpl:280
	}
//line draft-album-details.qtpl:280
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

        <footer class="row right-align">
            <button id="submit-button" class="btn waves-effect waves-light" type="submit">
                Save
                <i class="material-icons right"></i>
            </button>
        </footer>
    </form>
`)
//line draft-album-details.qtpl:312
}

//line draft-album-details.qtpl:312
func (p *DraftAlbumDetailsPage) WriteBody(qq422016 qtio422016.Writer) {
//line draft-album-details.qtpl:312
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:312
	p.StreamBody(qw422016)
//line draft-album-details.qtpl:312
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:312
}

//line draft-album-details.qtpl:312
func (p *DraftAlbumDetailsPage) Body() string {
//line draft-album-details.qtpl:312
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:312
	p.WriteBody(qb422016)
//line draft-album-details.qtpl:312
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:312
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:312
	return qs422016
//line draft-album-details.qtpl:312
}

//line draft-album-details.qtpl:314
func streammakeIntInput(qw422016 *qt422016.Writer, c intInputConfig) {
//line draft-album-details.qtpl:314
	qw422016.N().S(`
`)
//line draft-album-details.qtpl:315
	id := makeInputID(c.data.Name)

//line draft-album-details.qtpl:315
	qw422016.N().S(`
<div class="input-field `)
//line draft-album-details.qtpl:316
	qw422016.E().S(c.wraperClass)
//line draft-album-details.qtpl:316
	qw422016.N().S(`">
    <input
        id="`)
//line draft-album-details.qtpl:318
	qw422016.E().S(id)
//line draft-album-details.qtpl:318
	qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:319
	if c.disabled {
//line draft-album-details.qtpl:319
		qw422016.N().S(`
            disabled
        `)
//line draft-album-details.qtpl:321
	}
//line draft-album-details.qtpl:321
	qw422016.N().S(`
        type="number"
        class="validate"
        `)
//line draft-album-details.qtpl:324
	if c.data.Name != "" {
//line draft-album-details.qtpl:324
		qw422016.N().S(`
        name="`)
//line draft-album-details.qtpl:325
		qw422016.E().S(c.data.Name)
//line draft-album-details.qtpl:325
		qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:326
	}
//line draft-album-details.qtpl:326
	qw422016.N().S(`
        `)
//line draft-album-details.qtpl:327
	if c.data.Value != nil {
//line draft-album-details.qtpl:327
		qw422016.N().S(`
            value="`)
//line draft-album-details.qtpl:328
		qw422016.N().DL(*c.data.Value)
//line draft-album-details.qtpl:328
		qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:329
	}
//line draft-album-details.qtpl:329
	qw422016.N().S(`
        `)
//line draft-album-details.qtpl:330
	if c.min != nil {
//line draft-album-details.qtpl:330
		qw422016.N().S(`
            min="`)
//line draft-album-details.qtpl:331
		qw422016.N().DL(*c.min)
//line draft-album-details.qtpl:331
		qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:332
	}
//line draft-album-details.qtpl:332
	qw422016.N().S(`
    >
    <label for="`)
//line draft-album-details.qtpl:334
	qw422016.E().S(id)
//line draft-album-details.qtpl:334
	qw422016.N().S(`">`)
//line draft-album-details.qtpl:334
	qw422016.E().S(c.label)
//line draft-album-details.qtpl:334
	qw422016.N().S(`</label>
</div>
`)
//line draft-album-details.qtpl:336
}

//line draft-album-details.qtpl:336
func writemakeIntInput(qq422016 qtio422016.Writer, c intInputConfig) {
//line draft-album-details.qtpl:336
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:336
	streammakeIntInput(qw422016, c)
//line draft-album-details.qtpl:336
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:336
}

//line draft-album-details.qtpl:336
func makeIntInput(c intInputConfig) string {
//line draft-album-details.qtpl:336
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:336
	writemakeIntInput(qb422016, c)
//line draft-album-details.qtpl:336
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:336
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:336
	return qs422016
//line draft-album-details.qtpl:336
}

//line draft-album-details.qtpl:338
func streammakeStrInput(qw422016 *qt422016.Writer, c strInputConfig) {
//line draft-album-details.qtpl:338
	qw422016.N().S(`
`)
//line draft-album-details.qtpl:339
	id := makeInputID(c.data.Name)

//line draft-album-details.qtpl:339
	qw422016.N().S(`
<div class="input-field `)
//line draft-album-details.qtpl:340
	qw422016.E().S(c.wraperClass)
//line draft-album-details.qtpl:340
	qw422016.N().S(`">
    <input
        id="`)
//line draft-album-details.qtpl:342
	qw422016.E().S(id)
//line draft-album-details.qtpl:342
	qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:343
	if c.disabled {
//line draft-album-details.qtpl:343
		qw422016.N().S(`
        disabled
        `)
//line draft-album-details.qtpl:345
	}
//line draft-album-details.qtpl:345
	qw422016.N().S(`
        type="text"
        class="validate"
        `)
//line draft-album-details.qtpl:348
	if c.data.Name != "" {
//line draft-album-details.qtpl:348
		qw422016.N().S(`
        name="`)
//line draft-album-details.qtpl:349
		qw422016.E().S(c.data.Name)
//line draft-album-details.qtpl:349
		qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:350
	}
//line draft-album-details.qtpl:350
	qw422016.N().S(`
        value="`)
//line draft-album-details.qtpl:351
	qw422016.E().S(c.data.Value)
//line draft-album-details.qtpl:351
	qw422016.N().S(`"
    >
    <label for="`)
//line draft-album-details.qtpl:353
	qw422016.E().S(id)
//line draft-album-details.qtpl:353
	qw422016.N().S(`">`)
//line draft-album-details.qtpl:353
	qw422016.E().S(c.label)
//line draft-album-details.qtpl:353
	qw422016.N().S(`</label>
</div>
`)
//line draft-album-details.qtpl:355
}

//line draft-album-details.qtpl:355
func writemakeStrInput(qq422016 qtio422016.Writer, c strInputConfig) {
//line draft-album-details.qtpl:355
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:355
	streammakeStrInput(qw422016, c)
//line draft-album-details.qtpl:355
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:355
}

//line draft-album-details.qtpl:355
func makeStrInput(c strInputConfig) string {
//line draft-album-details.qtpl:355
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:355
	writemakeStrInput(qb422016, c)
//line draft-album-details.qtpl:355
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:355
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:355
	return qs422016
//line draft-album-details.qtpl:355
}

//line draft-album-details.qtpl:357
func streammakeSelect(qw422016 *qt422016.Writer, c selectConfig) {
//line draft-album-details.qtpl:357
	qw422016.N().S(`
`)
//line draft-album-details.qtpl:358
	id := makeInputID(c.data.Name)

//line draft-album-details.qtpl:358
	qw422016.N().S(`
<div class="input-field `)
//line draft-album-details.qtpl:359
	qw422016.E().S(c.wraperClass)
//line draft-album-details.qtpl:359
	qw422016.N().S(`">
    <select
        `)
//line draft-album-details.qtpl:361
	if c.data.Name != "" {
//line draft-album-details.qtpl:361
		qw422016.N().S(`
        name="`)
//line draft-album-details.qtpl:362
		qw422016.E().S(c.data.Name)
//line draft-album-details.qtpl:362
		qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:363
	}
//line draft-album-details.qtpl:363
	qw422016.N().S(`
        id="`)
//line draft-album-details.qtpl:364
	qw422016.E().S(id)
//line draft-album-details.qtpl:364
	qw422016.N().S(`"
    >
        `)
//line draft-album-details.qtpl:366
	for _, option := range c.data.Options {
//line draft-album-details.qtpl:366
		qw422016.N().S(`
        <option
            `)
//line draft-album-details.qtpl:368
		if option == c.data.Selected {
//line draft-album-details.qtpl:368
			qw422016.N().S(`
            selected
            `)
//line draft-album-details.qtpl:370
		}
//line draft-album-details.qtpl:370
		qw422016.N().S(`
            value="`)
//line draft-album-details.qtpl:371
		qw422016.E().S(option)
//line draft-album-details.qtpl:371
		qw422016.N().S(`"
            >`)
//line draft-album-details.qtpl:372
		qw422016.E().S(option)
//line draft-album-details.qtpl:372
		qw422016.N().S(`</option>
        `)
//line draft-album-details.qtpl:373
	}
//line draft-album-details.qtpl:373
	qw422016.N().S(`
    </select>
    <label for="`)
//line draft-album-details.qtpl:375
	qw422016.E().S(id)
//line draft-album-details.qtpl:375
	qw422016.N().S(`">`)
//line draft-album-details.qtpl:375
	qw422016.E().S(c.label)
//line draft-album-details.qtpl:375
	qw422016.N().S(`</label>
</div>
`)
//line draft-album-details.qtpl:377
}

//line draft-album-details.qtpl:377
func writemakeSelect(qq422016 qtio422016.Writer, c selectConfig) {
//line draft-album-details.qtpl:377
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:377
	streammakeSelect(qw422016, c)
//line draft-album-details.qtpl:377
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:377
}

//line draft-album-details.qtpl:377
func makeSelect(c selectConfig) string {
//line draft-album-details.qtpl:377
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:377
	writemakeSelect(qb422016, c)
//line draft-album-details.qtpl:377
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:377
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:377
	return qs422016
//line draft-album-details.qtpl:377
}
