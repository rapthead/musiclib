// Code generated by qtc from "draft-album-details.qtpl". DO NOT EDIT.
// See https://github.com/valyala/quicktemplate for details.

//line draft-album-details.qtpl:1
package views

//line draft-album-details.qtpl:1
import "strconv"

//line draft-album-details.qtpl:3
import (
	qtio422016 "io"

	qt422016 "github.com/valyala/quicktemplate"
)

//line draft-album-details.qtpl:3
var (
	_ = qtio422016.Copy
	_ = qt422016.AcquireByteBuffer
)

//line draft-album-details.qtpl:4
type AlbumData interface {
	ID() string
	Path() string
	Artist() string
	Title() string
	Type() string
	DownloadSource() string
	SourceID() string
	Year() *int
	ReleaseYear() *int
}

type TrackData interface {
	ID() string
	Path() string
	TrackArtist() string
	Title() string
	Disc() *int
	TrackNum() *int
}

type CoverData interface {
	ID() string
	Filename() string
	URL() string
	Sort() *int
	Type() string
}

type DraftAlbumDetailsPage struct {
	AllDownloadSources []string
	AllAlbumTypes      []string
	AllCoverTypes      []string

	Album  AlbumData
	Tracks []TrackData
	Covers []CoverData
}

type baseInputConfig struct {
	wraperClass string
	disabled    bool
	name        string
	label       string
}

type strInputConfig struct {
	baseInputConfig
	value string
}

type intInputConfig struct {
	baseInputConfig
	value *int
	min   *int
}

type selectConfig struct {
	baseInputConfig

	options  []string
	selected string
}

func takeIntPtr(val int) *int {
	return &val
}

//line draft-album-details.qtpl:74
func (p *DraftAlbumDetailsPage) StreamTitle(qw422016 *qt422016.Writer) {
//line draft-album-details.qtpl:74
	qw422016.N().S(`
    Draft albums
`)
//line draft-album-details.qtpl:76
}

//line draft-album-details.qtpl:76
func (p *DraftAlbumDetailsPage) WriteTitle(qq422016 qtio422016.Writer) {
//line draft-album-details.qtpl:76
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:76
	p.StreamTitle(qw422016)
//line draft-album-details.qtpl:76
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:76
}

//line draft-album-details.qtpl:76
func (p *DraftAlbumDetailsPage) Title() string {
//line draft-album-details.qtpl:76
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:76
	p.WriteTitle(qb422016)
//line draft-album-details.qtpl:76
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:76
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:76
	return qs422016
//line draft-album-details.qtpl:76
}

//line draft-album-details.qtpl:78
func (p *DraftAlbumDetailsPage) StreamBody(qw422016 *qt422016.Writer) {
//line draft-album-details.qtpl:78
	qw422016.N().S(`
    <form class="container" method="POST" enctype="multipart/form-data">
        <div class="card">
            <div class="row">
                <input type="hidden" name="album.id" value="`)
//line draft-album-details.qtpl:82
	qw422016.E().S(p.Album.ID())
//line draft-album-details.qtpl:82
	qw422016.N().S(`" />

                `)
//line draft-album-details.qtpl:85
	streammakeStrInput(qw422016, strInputConfig{
		baseInputConfig: baseInputConfig{
			wraperClass: "col s6",
			name:        "album.artist",
			label:       "Draft artist",
		},
		value: p.Album.Artist(),
	})
//line draft-album-details.qtpl:93
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:96
	streammakeStrInput(qw422016, strInputConfig{
		baseInputConfig: baseInputConfig{
			wraperClass: "col s6",
			name:        "album.title",
			label:       "Title",
		},
		value: p.Album.Title(),
	})
//line draft-album-details.qtpl:104
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:107
	streammakeStrInput(qw422016, strInputConfig{
		baseInputConfig: baseInputConfig{
			wraperClass: "col s6",
			disabled:    true,
			name:        "album.path",
			label:       "Path",
		},
		value: p.Album.Path(),
	})
//line draft-album-details.qtpl:116
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:119
	streammakeIntInput(qw422016, intInputConfig{
		baseInputConfig: baseInputConfig{
			wraperClass: "col s6",
			name:        "album.year",
			label:       "Year",
		},
		value: p.Album.Year(),
		min:   takeIntPtr(1990),
	})
//line draft-album-details.qtpl:128
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:131
	streammakeIntInput(qw422016, intInputConfig{
		baseInputConfig: baseInputConfig{
			wraperClass: "col s6",
			name:        "album.release_year",
			label:       "Release year",
		},
		value: p.Album.ReleaseYear(),
		min:   takeIntPtr(1990),
	})
//line draft-album-details.qtpl:140
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:143
	streammakeSelect(qw422016, selectConfig{
		baseInputConfig: baseInputConfig{
			wraperClass: "col s6",
			name:        "album.type",
			label:       "Type",
		},

		options:  p.AllAlbumTypes,
		selected: p.Album.Type(),
	})
//line draft-album-details.qtpl:153
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:156
	streammakeSelect(qw422016, selectConfig{
		baseInputConfig: baseInputConfig{
			wraperClass: "col s6",
			name:        "album.download_source",
			label:       "Download source",
		},

		options:  p.AllDownloadSources,
		selected: p.Album.DownloadSource(),
	})
//line draft-album-details.qtpl:166
	qw422016.N().S(`

                `)
//line draft-album-details.qtpl:169
	streammakeStrInput(qw422016, strInputConfig{
		baseInputConfig: baseInputConfig{
			wraperClass: "col s6",
			name:        "album.source_id",
			label:       "Source id",
		},

		value: p.Album.SourceID(),
	})
//line draft-album-details.qtpl:178
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
//line draft-album-details.qtpl:193
	for i, t := range p.Tracks {
//line draft-album-details.qtpl:193
		qw422016.N().S(`
                    <tr>
                        <th>
                            <input
                                type="hidden"
                                name="`)
//line draft-album-details.qtpl:198
		qw422016.E().S("tracks." + strconv.Itoa(i) + ".id")
//line draft-album-details.qtpl:198
		qw422016.N().S(`"
                                value="`)
//line draft-album-details.qtpl:199
		qw422016.E().S(t.ID())
//line draft-album-details.qtpl:199
		qw422016.N().S(`"
                            />

                            `)
//line draft-album-details.qtpl:203
		streammakeStrInput(qw422016, strInputConfig{
			baseInputConfig: baseInputConfig{
				name:     "tracks." + strconv.Itoa(i) + ".path",
				label:    "Path",
				disabled: true,
			},

			value: t.Path(),
		})
//line draft-album-details.qtpl:212
		qw422016.N().S(`
                        </th>
                        <td>
                            `)
//line draft-album-details.qtpl:216
		streammakeStrInput(qw422016, strInputConfig{
			baseInputConfig: baseInputConfig{
				name:  "tracks." + strconv.Itoa(i) + ".title",
				label: "Title",
			},

			value: t.Title(),
		})
//line draft-album-details.qtpl:224
		qw422016.N().S(`
                        </td>
                        <td>
                            `)
//line draft-album-details.qtpl:228
		streammakeIntInput(qw422016, intInputConfig{
			baseInputConfig: baseInputConfig{
				name:  "tracks." + strconv.Itoa(i) + ".track_num",
				label: "Track number",
			},

			min:   takeIntPtr(0),
			value: t.TrackNum(),
		})
//line draft-album-details.qtpl:237
		qw422016.N().S(`
                        </td>
                        <td>
                            `)
//line draft-album-details.qtpl:241
		streammakeIntInput(qw422016, intInputConfig{
			baseInputConfig: baseInputConfig{
				name:  "tracks." + strconv.Itoa(i) + ".disc",
				label: "Disc number",
			},

			min:   takeIntPtr(0),
			value: t.Disc(),
		})
//line draft-album-details.qtpl:250
		qw422016.N().S(`
                        </td>
                        <td>
                            `)
//line draft-album-details.qtpl:254
		streammakeStrInput(qw422016, strInputConfig{
			baseInputConfig: baseInputConfig{
				name:  "tracks." + strconv.Itoa(i) + ".track_artist",
				label: "TrackArtist",
			},

			value: t.TrackArtist(),
		})
//line draft-album-details.qtpl:262
		qw422016.N().S(`
                        </td>
                    </tr>
                    `)
//line draft-album-details.qtpl:265
	}
//line draft-album-details.qtpl:265
	qw422016.N().S(`
                </tbody>
            </table>
        </div>

        <div class="card">
            <div class="row">
            `)
//line draft-album-details.qtpl:272
	for i, c := range p.Covers {
//line draft-album-details.qtpl:272
		qw422016.N().S(`
                `)
//line draft-album-details.qtpl:273
		if i%2 == 0 {
//line draft-album-details.qtpl:273
			qw422016.N().S(`
                <div class="clearfix"></div>
                `)
//line draft-album-details.qtpl:275
		}
//line draft-album-details.qtpl:275
		qw422016.N().S(`
                <div class ="col s6">
                    <div class="row">
                        <div class="col s6">
                            <input
                                type="hidden"
                                name="`)
//line draft-album-details.qtpl:281
		qw422016.E().S("covers." + strconv.Itoa(i) + ".id")
//line draft-album-details.qtpl:281
		qw422016.N().S(`"
                                value="`)
//line draft-album-details.qtpl:282
		qw422016.E().S(c.ID())
//line draft-album-details.qtpl:282
		qw422016.N().S(`"
                            />

                            <img class="materialboxed responsive-img" src="`)
//line draft-album-details.qtpl:285
		qw422016.E().S(c.URL())
//line draft-album-details.qtpl:285
		qw422016.N().S(`" />
                        </div>

                        <div class="col s6">
                            <div class="row">
                                <div class="col s12">
                                    <h4>`)
//line draft-album-details.qtpl:291
		qw422016.E().S(c.Filename())
//line draft-album-details.qtpl:291
		qw422016.N().S(`</h4>
                                </div>

                                <div class="col s6">
                                    `)
//line draft-album-details.qtpl:296
		streammakeSelect(qw422016, selectConfig{
			baseInputConfig: baseInputConfig{
				name:  "covers." + strconv.Itoa(i) + ".type",
				label: "Cover type",
			},

			options:  p.AllCoverTypes,
			selected: c.Type(),
		})
//line draft-album-details.qtpl:305
		qw422016.N().S(`
                                </div>

                                <div class="col s6">
                                    `)
//line draft-album-details.qtpl:310
		streammakeIntInput(qw422016, intInputConfig{
			baseInputConfig: baseInputConfig{
				name:  "covers." + strconv.Itoa(i) + ".sort",
				label: "Sort",
			},

			min:   takeIntPtr(0),
			value: c.Sort(),
		})
//line draft-album-details.qtpl:319
		qw422016.N().S(`
                                </div>

                                <div class="col s12">
                                    <label>
                                        <input
                                            type="checkbox"
                                            name="`)
//line draft-album-details.qtpl:326
		qw422016.E().S("delete_covers")
//line draft-album-details.qtpl:326
		qw422016.N().S(`"
                                            value="`)
//line draft-album-details.qtpl:327
		qw422016.E().S(c.ID())
//line draft-album-details.qtpl:327
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
//line draft-album-details.qtpl:336
	}
//line draft-album-details.qtpl:336
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
//line draft-album-details.qtpl:368
}

//line draft-album-details.qtpl:368
func (p *DraftAlbumDetailsPage) WriteBody(qq422016 qtio422016.Writer) {
//line draft-album-details.qtpl:368
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:368
	p.StreamBody(qw422016)
//line draft-album-details.qtpl:368
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:368
}

//line draft-album-details.qtpl:368
func (p *DraftAlbumDetailsPage) Body() string {
//line draft-album-details.qtpl:368
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:368
	p.WriteBody(qb422016)
//line draft-album-details.qtpl:368
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:368
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:368
	return qs422016
//line draft-album-details.qtpl:368
}

//line draft-album-details.qtpl:370
func streammakeIntInput(qw422016 *qt422016.Writer, c intInputConfig) {
//line draft-album-details.qtpl:370
	qw422016.N().S(`
<div class="input-field `)
//line draft-album-details.qtpl:371
	qw422016.E().S(c.wraperClass)
//line draft-album-details.qtpl:371
	qw422016.N().S(`">
    <input
        id="`)
//line draft-album-details.qtpl:373
	qw422016.E().S(c.name)
//line draft-album-details.qtpl:373
	qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:374
	if c.disabled {
//line draft-album-details.qtpl:374
		qw422016.N().S(`
            disabled
        `)
//line draft-album-details.qtpl:376
	}
//line draft-album-details.qtpl:376
	qw422016.N().S(`
        type="number"
        class="validate"
        name="`)
//line draft-album-details.qtpl:379
	qw422016.E().S(c.name)
//line draft-album-details.qtpl:379
	qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:380
	if c.value != nil {
//line draft-album-details.qtpl:380
		qw422016.N().S(`
            value="`)
//line draft-album-details.qtpl:381
		qw422016.N().D(*c.value)
//line draft-album-details.qtpl:381
		qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:382
	}
//line draft-album-details.qtpl:382
	qw422016.N().S(`
        `)
//line draft-album-details.qtpl:383
	if c.min != nil {
//line draft-album-details.qtpl:383
		qw422016.N().S(`
            min="`)
//line draft-album-details.qtpl:384
		qw422016.N().D(*c.min)
//line draft-album-details.qtpl:384
		qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:385
	}
//line draft-album-details.qtpl:385
	qw422016.N().S(`
    >
    <label for="`)
//line draft-album-details.qtpl:387
	qw422016.E().S(c.name)
//line draft-album-details.qtpl:387
	qw422016.N().S(`">`)
//line draft-album-details.qtpl:387
	qw422016.E().S(c.label)
//line draft-album-details.qtpl:387
	qw422016.N().S(`</label>
</div>
`)
//line draft-album-details.qtpl:389
}

//line draft-album-details.qtpl:389
func writemakeIntInput(qq422016 qtio422016.Writer, c intInputConfig) {
//line draft-album-details.qtpl:389
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:389
	streammakeIntInput(qw422016, c)
//line draft-album-details.qtpl:389
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:389
}

//line draft-album-details.qtpl:389
func makeIntInput(c intInputConfig) string {
//line draft-album-details.qtpl:389
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:389
	writemakeIntInput(qb422016, c)
//line draft-album-details.qtpl:389
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:389
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:389
	return qs422016
//line draft-album-details.qtpl:389
}

//line draft-album-details.qtpl:391
func streammakeStrInput(qw422016 *qt422016.Writer, c strInputConfig) {
//line draft-album-details.qtpl:391
	qw422016.N().S(`
<div class="input-field `)
//line draft-album-details.qtpl:392
	qw422016.E().S(c.wraperClass)
//line draft-album-details.qtpl:392
	qw422016.N().S(`">
    <input
        id="`)
//line draft-album-details.qtpl:394
	qw422016.E().S(c.name)
//line draft-album-details.qtpl:394
	qw422016.N().S(`"
        `)
//line draft-album-details.qtpl:395
	if c.disabled {
//line draft-album-details.qtpl:395
		qw422016.N().S(`
            disabled
        `)
//line draft-album-details.qtpl:397
	}
//line draft-album-details.qtpl:397
	qw422016.N().S(`
        type="text"
        class="validate"
        name="`)
//line draft-album-details.qtpl:400
	qw422016.E().S(c.name)
//line draft-album-details.qtpl:400
	qw422016.N().S(`"
        value="`)
//line draft-album-details.qtpl:401
	qw422016.E().S(c.value)
//line draft-album-details.qtpl:401
	qw422016.N().S(`"
    >
    <label for="`)
//line draft-album-details.qtpl:403
	qw422016.E().S(c.name)
//line draft-album-details.qtpl:403
	qw422016.N().S(`">`)
//line draft-album-details.qtpl:403
	qw422016.E().S(c.label)
//line draft-album-details.qtpl:403
	qw422016.N().S(`</label>
</div>
`)
//line draft-album-details.qtpl:405
}

//line draft-album-details.qtpl:405
func writemakeStrInput(qq422016 qtio422016.Writer, c strInputConfig) {
//line draft-album-details.qtpl:405
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:405
	streammakeStrInput(qw422016, c)
//line draft-album-details.qtpl:405
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:405
}

//line draft-album-details.qtpl:405
func makeStrInput(c strInputConfig) string {
//line draft-album-details.qtpl:405
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:405
	writemakeStrInput(qb422016, c)
//line draft-album-details.qtpl:405
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:405
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:405
	return qs422016
//line draft-album-details.qtpl:405
}

//line draft-album-details.qtpl:407
func streammakeSelect(qw422016 *qt422016.Writer, c selectConfig) {
//line draft-album-details.qtpl:407
	qw422016.N().S(`
<div class="input-field `)
//line draft-album-details.qtpl:408
	qw422016.E().S(c.wraperClass)
//line draft-album-details.qtpl:408
	qw422016.N().S(`">
    <select
        name="`)
//line draft-album-details.qtpl:410
	qw422016.E().S(c.name)
//line draft-album-details.qtpl:410
	qw422016.N().S(`"
        id="`)
//line draft-album-details.qtpl:411
	qw422016.E().S(c.name)
//line draft-album-details.qtpl:411
	qw422016.N().S(`"
    >
        `)
//line draft-album-details.qtpl:413
	for _, option := range c.options {
//line draft-album-details.qtpl:413
		qw422016.N().S(`
        <option
            `)
//line draft-album-details.qtpl:415
		if option == c.selected {
//line draft-album-details.qtpl:415
			qw422016.N().S(`
            selected
            `)
//line draft-album-details.qtpl:417
		}
//line draft-album-details.qtpl:417
		qw422016.N().S(`
            value="`)
//line draft-album-details.qtpl:418
		qw422016.E().S(option)
//line draft-album-details.qtpl:418
		qw422016.N().S(`"
            >`)
//line draft-album-details.qtpl:419
		qw422016.E().S(option)
//line draft-album-details.qtpl:419
		qw422016.N().S(`</option>
        `)
//line draft-album-details.qtpl:420
	}
//line draft-album-details.qtpl:420
	qw422016.N().S(`
    </select>
    <label for="`)
//line draft-album-details.qtpl:422
	qw422016.E().S(c.name)
//line draft-album-details.qtpl:422
	qw422016.N().S(`">`)
//line draft-album-details.qtpl:422
	qw422016.E().S(c.label)
//line draft-album-details.qtpl:422
	qw422016.N().S(`</label>
</div>
`)
//line draft-album-details.qtpl:424
}

//line draft-album-details.qtpl:424
func writemakeSelect(qq422016 qtio422016.Writer, c selectConfig) {
//line draft-album-details.qtpl:424
	qw422016 := qt422016.AcquireWriter(qq422016)
//line draft-album-details.qtpl:424
	streammakeSelect(qw422016, c)
//line draft-album-details.qtpl:424
	qt422016.ReleaseWriter(qw422016)
//line draft-album-details.qtpl:424
}

//line draft-album-details.qtpl:424
func makeSelect(c selectConfig) string {
//line draft-album-details.qtpl:424
	qb422016 := qt422016.AcquireByteBuffer()
//line draft-album-details.qtpl:424
	writemakeSelect(qb422016, c)
//line draft-album-details.qtpl:424
	qs422016 := string(qb422016.B)
//line draft-album-details.qtpl:424
	qt422016.ReleaseByteBuffer(qb422016)
//line draft-album-details.qtpl:424
	return qs422016
//line draft-album-details.qtpl:424
}
