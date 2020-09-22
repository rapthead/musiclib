// Code generated by qtc from "album-list.qtpl". DO NOT EDIT.
// See https://github.com/valyala/quicktemplate for details.

//line album-list.qtpl:1
package views

//line album-list.qtpl:1
import (
	qtio422016 "io"

	qt422016 "github.com/valyala/quicktemplate"
)

//line album-list.qtpl:1
var (
	_ = qtio422016.Copy
	_ = qt422016.AcquireByteBuffer
)

//line album-list.qtpl:2
type AlbumsRow interface {
	URL() string
	Path() string
	Artist() string
	Title() string
	State() string
}

type AlbumsPage struct {
	Rows []AlbumsRow
}

//line album-list.qtpl:16
func (p *AlbumsPage) StreamTitle(qw422016 *qt422016.Writer) {
//line album-list.qtpl:16
	qw422016.N().S(`
    Album list
`)
//line album-list.qtpl:18
}

//line album-list.qtpl:18
func (p *AlbumsPage) WriteTitle(qq422016 qtio422016.Writer) {
//line album-list.qtpl:18
	qw422016 := qt422016.AcquireWriter(qq422016)
//line album-list.qtpl:18
	p.StreamTitle(qw422016)
//line album-list.qtpl:18
	qt422016.ReleaseWriter(qw422016)
//line album-list.qtpl:18
}

//line album-list.qtpl:18
func (p *AlbumsPage) Title() string {
//line album-list.qtpl:18
	qb422016 := qt422016.AcquireByteBuffer()
//line album-list.qtpl:18
	p.WriteTitle(qb422016)
//line album-list.qtpl:18
	qs422016 := string(qb422016.B)
//line album-list.qtpl:18
	qt422016.ReleaseByteBuffer(qb422016)
//line album-list.qtpl:18
	return qs422016
//line album-list.qtpl:18
}

//line album-list.qtpl:21
func (p *AlbumsPage) StreamBody(qw422016 *qt422016.Writer) {
//line album-list.qtpl:21
	qw422016.N().S(`
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Path</th>
                    <th>State</th>
                    <th>Artist</th>
                    <th>Title</th>
                </tr>
            </thead>

            <tbody>
`)
//line album-list.qtpl:34
	for _, r := range p.Rows {
//line album-list.qtpl:34
		qw422016.N().S(`                <tr>
                    <th><a href="`)
//line album-list.qtpl:36
		qw422016.E().S(r.URL())
//line album-list.qtpl:36
		qw422016.N().S(`">`)
//line album-list.qtpl:36
		qw422016.E().S(r.Path())
//line album-list.qtpl:36
		qw422016.N().S(`</a></th>
                    <td>`)
//line album-list.qtpl:37
		qw422016.E().S(r.State())
//line album-list.qtpl:37
		qw422016.N().S(`</td>
                    <td>`)
//line album-list.qtpl:38
		qw422016.E().S(r.Artist())
//line album-list.qtpl:38
		qw422016.N().S(`</td>
                    <td>`)
//line album-list.qtpl:39
		qw422016.E().S(r.Title())
//line album-list.qtpl:39
		qw422016.N().S(`</td>
                </tr>
`)
//line album-list.qtpl:41
	}
//line album-list.qtpl:41
	qw422016.N().S(`            </tbody>
        </table>
    </div>
`)
//line album-list.qtpl:45
}

//line album-list.qtpl:45
func (p *AlbumsPage) WriteBody(qq422016 qtio422016.Writer) {
//line album-list.qtpl:45
	qw422016 := qt422016.AcquireWriter(qq422016)
//line album-list.qtpl:45
	p.StreamBody(qw422016)
//line album-list.qtpl:45
	qt422016.ReleaseWriter(qw422016)
//line album-list.qtpl:45
}

//line album-list.qtpl:45
func (p *AlbumsPage) Body() string {
//line album-list.qtpl:45
	qb422016 := qt422016.AcquireByteBuffer()
//line album-list.qtpl:45
	p.WriteBody(qb422016)
//line album-list.qtpl:45
	qs422016 := string(qb422016.B)
//line album-list.qtpl:45
	qt422016.ReleaseByteBuffer(qb422016)
//line album-list.qtpl:45
	return qs422016
//line album-list.qtpl:45
}
