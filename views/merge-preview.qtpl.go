// Code generated by qtc from "merge-preview.qtpl". DO NOT EDIT.
// See https://github.com/valyala/quicktemplate for details.

//line merge-preview.qtpl:1
package views

//line merge-preview.qtpl:1
import (
	qtio422016 "io"

	qt422016 "github.com/valyala/quicktemplate"
)

//line merge-preview.qtpl:1
var (
	_ = qtio422016.Copy
	_ = qt422016.AcquireByteBuffer
)

//line merge-preview.qtpl:2
type MergeAlbumsPage struct {
	Error              error
	RecipientFilePaths []string
	DonorFilePaths     []string
}

//line merge-preview.qtpl:9
func (p *MergeAlbumsPage) StreamTitle(qw422016 *qt422016.Writer) {
//line merge-preview.qtpl:9
	qw422016.N().S(`
    Merge albums
`)
//line merge-preview.qtpl:11
}

//line merge-preview.qtpl:11
func (p *MergeAlbumsPage) WriteTitle(qq422016 qtio422016.Writer) {
//line merge-preview.qtpl:11
	qw422016 := qt422016.AcquireWriter(qq422016)
//line merge-preview.qtpl:11
	p.StreamTitle(qw422016)
//line merge-preview.qtpl:11
	qt422016.ReleaseWriter(qw422016)
//line merge-preview.qtpl:11
}

//line merge-preview.qtpl:11
func (p *MergeAlbumsPage) Title() string {
//line merge-preview.qtpl:11
	qb422016 := qt422016.AcquireByteBuffer()
//line merge-preview.qtpl:11
	p.WriteTitle(qb422016)
//line merge-preview.qtpl:11
	qs422016 := string(qb422016.B)
//line merge-preview.qtpl:11
	qt422016.ReleaseByteBuffer(qb422016)
//line merge-preview.qtpl:11
	return qs422016
//line merge-preview.qtpl:11
}

//line merge-preview.qtpl:13
func (p *MergeAlbumsPage) StreamBody(qw422016 *qt422016.Writer) {
//line merge-preview.qtpl:13
	qw422016.N().S(`
    <form class="container" method="POST" enctype="multipart/form-data">
        `)
//line merge-preview.qtpl:15
	if p.Error != nil {
//line merge-preview.qtpl:15
		qw422016.N().S(`
        <div class="card-panel red white-text" id="error">
            `)
//line merge-preview.qtpl:17
		qw422016.E().S(p.Error.Error())
//line merge-preview.qtpl:17
		qw422016.N().S(`
        </div>
        `)
//line merge-preview.qtpl:19
	} else {
//line merge-preview.qtpl:19
		qw422016.N().S(`
        <table class="merge-preview-table">
            <thead>
                <th>From</th>
                <th>To</th>
            </thead>

            <tbody>
            `)
//line merge-preview.qtpl:27
		for i := 0; i < len(p.RecipientFilePaths); i++ {
//line merge-preview.qtpl:27
			qw422016.N().S(`
                <tr>
                    <td class="merge-preview-table-donor">`)
//line merge-preview.qtpl:29
			qw422016.E().S(p.DonorFilePaths[i])
//line merge-preview.qtpl:29
			qw422016.N().S(`</td>
                    <td class="merge-preview-table-recipient">`)
//line merge-preview.qtpl:30
			qw422016.E().S(p.RecipientFilePaths[i])
//line merge-preview.qtpl:30
			qw422016.N().S(`</td>
                </tr>
            `)
//line merge-preview.qtpl:32
		}
//line merge-preview.qtpl:32
		qw422016.N().S(`
            </tbody>
        </table>

        <footer class="row" id="footer">
            <div class="col s6 right-align">
                <button class="btn waves-effect waves-light" type="submit">
                    Confirm
                    <i class="material-icons right"></i>
                </button>
            </div>
        </footer>
        `)
//line merge-preview.qtpl:44
	}
//line merge-preview.qtpl:44
	qw422016.N().S(`
    </form>
`)
//line merge-preview.qtpl:46
}

//line merge-preview.qtpl:46
func (p *MergeAlbumsPage) WriteBody(qq422016 qtio422016.Writer) {
//line merge-preview.qtpl:46
	qw422016 := qt422016.AcquireWriter(qq422016)
//line merge-preview.qtpl:46
	p.StreamBody(qw422016)
//line merge-preview.qtpl:46
	qt422016.ReleaseWriter(qw422016)
//line merge-preview.qtpl:46
}

//line merge-preview.qtpl:46
func (p *MergeAlbumsPage) Body() string {
//line merge-preview.qtpl:46
	qb422016 := qt422016.AcquireByteBuffer()
//line merge-preview.qtpl:46
	p.WriteBody(qb422016)
//line merge-preview.qtpl:46
	qs422016 := string(qb422016.B)
//line merge-preview.qtpl:46
	qt422016.ReleaseByteBuffer(qb422016)
//line merge-preview.qtpl:46
	return qs422016
//line merge-preview.qtpl:46
}
