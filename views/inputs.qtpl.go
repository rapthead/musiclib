// Code generated by qtc from "inputs.qtpl". DO NOT EDIT.
// See https://github.com/valyala/quicktemplate for details.

//line inputs.qtpl:1
package views

//line inputs.qtpl:1
import (
	qtio422016 "io"

	qt422016 "github.com/valyala/quicktemplate"
)

//line inputs.qtpl:1
var (
	_ = qtio422016.Copy
	_ = qt422016.AcquireByteBuffer
)

//line inputs.qtpl:2
type strDatalistInputConfig struct {
	wraperClass string
	disabled    bool
	label       string
	required    bool

	data StrDatalistInputData
}

type strInputConfig struct {
	wraperClass string
	disabled    bool
	label       string
	required    bool

	data StrInputData
}

type intInputConfig struct {
	wraperClass string
	disabled    bool
	label       string
	required    bool

	min  *int64
	data IntInputData
}

type selectConfig struct {
	wraperClass string
	disabled    bool
	label       string
	required    bool

	data SelectInputData
}

type chipsInputConfig struct {
	wraperClass string
	label       string
	data        ChipsInputData
}

//line inputs.qtpl:47
func streammakeIntInput(qw422016 *qt422016.Writer, c intInputConfig) {
//line inputs.qtpl:47
	qw422016.N().S(`
`)
//line inputs.qtpl:48
	id := makeInputID(c.data.Name)

//line inputs.qtpl:48
	qw422016.N().S(`
<div class="input-field `)
//line inputs.qtpl:49
	qw422016.E().S(c.wraperClass)
//line inputs.qtpl:49
	qw422016.N().S(`">
    <input
        id="`)
//line inputs.qtpl:51
	qw422016.E().S(id)
//line inputs.qtpl:51
	qw422016.N().S(`"

        `)
//line inputs.qtpl:53
	if c.disabled {
//line inputs.qtpl:53
		qw422016.N().S(`
            disabled
        `)
//line inputs.qtpl:55
	}
//line inputs.qtpl:55
	qw422016.N().S(`

        `)
//line inputs.qtpl:57
	if c.required {
//line inputs.qtpl:57
		qw422016.N().S(`
        required
        `)
//line inputs.qtpl:59
	}
//line inputs.qtpl:59
	qw422016.N().S(`

        type="number"
        class="validate"
        `)
//line inputs.qtpl:63
	if c.data.Name != "" {
//line inputs.qtpl:63
		qw422016.N().S(`
        name="`)
//line inputs.qtpl:64
		qw422016.E().S(c.data.Name)
//line inputs.qtpl:64
		qw422016.N().S(`"
        `)
//line inputs.qtpl:65
	}
//line inputs.qtpl:65
	qw422016.N().S(`
        `)
//line inputs.qtpl:66
	if c.data.Value != nil {
//line inputs.qtpl:66
		qw422016.N().S(`
            value="`)
//line inputs.qtpl:67
		qw422016.N().DL(*c.data.Value)
//line inputs.qtpl:67
		qw422016.N().S(`"
        `)
//line inputs.qtpl:68
	}
//line inputs.qtpl:68
	qw422016.N().S(`
        `)
//line inputs.qtpl:69
	if c.min != nil {
//line inputs.qtpl:69
		qw422016.N().S(`
            min="`)
//line inputs.qtpl:70
		qw422016.N().DL(*c.min)
//line inputs.qtpl:70
		qw422016.N().S(`"
        `)
//line inputs.qtpl:71
	}
//line inputs.qtpl:71
	qw422016.N().S(`
    >
    <label for="`)
//line inputs.qtpl:73
	qw422016.E().S(id)
//line inputs.qtpl:73
	qw422016.N().S(`">`)
//line inputs.qtpl:73
	qw422016.E().S(c.label)
//line inputs.qtpl:73
	qw422016.N().S(`</label>
</div>
`)
//line inputs.qtpl:75
}

//line inputs.qtpl:75
func writemakeIntInput(qq422016 qtio422016.Writer, c intInputConfig) {
//line inputs.qtpl:75
	qw422016 := qt422016.AcquireWriter(qq422016)
//line inputs.qtpl:75
	streammakeIntInput(qw422016, c)
//line inputs.qtpl:75
	qt422016.ReleaseWriter(qw422016)
//line inputs.qtpl:75
}

//line inputs.qtpl:75
func makeIntInput(c intInputConfig) string {
//line inputs.qtpl:75
	qb422016 := qt422016.AcquireByteBuffer()
//line inputs.qtpl:75
	writemakeIntInput(qb422016, c)
//line inputs.qtpl:75
	qs422016 := string(qb422016.B)
//line inputs.qtpl:75
	qt422016.ReleaseByteBuffer(qb422016)
//line inputs.qtpl:75
	return qs422016
//line inputs.qtpl:75
}

//line inputs.qtpl:77
func streammakeStrInput(qw422016 *qt422016.Writer, c strInputConfig) {
//line inputs.qtpl:77
	qw422016.N().S(`
`)
//line inputs.qtpl:78
	id := makeInputID(c.data.Name)

//line inputs.qtpl:78
	qw422016.N().S(`
<div class="input-field `)
//line inputs.qtpl:79
	qw422016.E().S(c.wraperClass)
//line inputs.qtpl:79
	qw422016.N().S(`">
    <input
        id="`)
//line inputs.qtpl:81
	qw422016.E().S(id)
//line inputs.qtpl:81
	qw422016.N().S(`"

        `)
//line inputs.qtpl:83
	if c.disabled {
//line inputs.qtpl:83
		qw422016.N().S(`
        disabled
        `)
//line inputs.qtpl:85
	}
//line inputs.qtpl:85
	qw422016.N().S(`

        `)
//line inputs.qtpl:87
	if c.required {
//line inputs.qtpl:87
		qw422016.N().S(`
        required
        `)
//line inputs.qtpl:89
	}
//line inputs.qtpl:89
	qw422016.N().S(`

        type="text"
        class="validate"
        `)
//line inputs.qtpl:93
	if c.data.Name != "" {
//line inputs.qtpl:93
		qw422016.N().S(`
        name="`)
//line inputs.qtpl:94
		qw422016.E().S(c.data.Name)
//line inputs.qtpl:94
		qw422016.N().S(`"
        `)
//line inputs.qtpl:95
	}
//line inputs.qtpl:95
	qw422016.N().S(`
        value="`)
//line inputs.qtpl:96
	qw422016.E().S(c.data.Value)
//line inputs.qtpl:96
	qw422016.N().S(`"
    >
    <label for="`)
//line inputs.qtpl:98
	qw422016.E().S(id)
//line inputs.qtpl:98
	qw422016.N().S(`">`)
//line inputs.qtpl:98
	qw422016.E().S(c.label)
//line inputs.qtpl:98
	qw422016.N().S(`</label>
</div>
`)
//line inputs.qtpl:100
}

//line inputs.qtpl:100
func writemakeStrInput(qq422016 qtio422016.Writer, c strInputConfig) {
//line inputs.qtpl:100
	qw422016 := qt422016.AcquireWriter(qq422016)
//line inputs.qtpl:100
	streammakeStrInput(qw422016, c)
//line inputs.qtpl:100
	qt422016.ReleaseWriter(qw422016)
//line inputs.qtpl:100
}

//line inputs.qtpl:100
func makeStrInput(c strInputConfig) string {
//line inputs.qtpl:100
	qb422016 := qt422016.AcquireByteBuffer()
//line inputs.qtpl:100
	writemakeStrInput(qb422016, c)
//line inputs.qtpl:100
	qs422016 := string(qb422016.B)
//line inputs.qtpl:100
	qt422016.ReleaseByteBuffer(qb422016)
//line inputs.qtpl:100
	return qs422016
//line inputs.qtpl:100
}

//line inputs.qtpl:102
func streammakeSelect(qw422016 *qt422016.Writer, c selectConfig) {
//line inputs.qtpl:102
	qw422016.N().S(`
`)
//line inputs.qtpl:103
	id := makeInputID(c.data.Name)

//line inputs.qtpl:103
	qw422016.N().S(`
<div class="input-field `)
//line inputs.qtpl:104
	qw422016.E().S(c.wraperClass)
//line inputs.qtpl:104
	qw422016.N().S(`">
    <select
        `)
//line inputs.qtpl:106
	if c.data.Name != "" {
//line inputs.qtpl:106
		qw422016.N().S(`
        name="`)
//line inputs.qtpl:107
		qw422016.E().S(c.data.Name)
//line inputs.qtpl:107
		qw422016.N().S(`"
        `)
//line inputs.qtpl:108
	}
//line inputs.qtpl:108
	qw422016.N().S(`
        id="`)
//line inputs.qtpl:109
	qw422016.E().S(id)
//line inputs.qtpl:109
	qw422016.N().S(`"
    >
        `)
//line inputs.qtpl:111
	for _, option := range c.data.Options {
//line inputs.qtpl:111
		qw422016.N().S(`
        <option
            `)
//line inputs.qtpl:113
		if option.Selected {
//line inputs.qtpl:113
			qw422016.N().S(`
            selected
            `)
//line inputs.qtpl:115
		}
//line inputs.qtpl:115
		qw422016.N().S(`
            value="`)
//line inputs.qtpl:116
		qw422016.E().S(option.Value)
//line inputs.qtpl:116
		qw422016.N().S(`"
            >`)
//line inputs.qtpl:117
		qw422016.E().S(option.Label)
//line inputs.qtpl:117
		qw422016.N().S(`</option>
        `)
//line inputs.qtpl:118
	}
//line inputs.qtpl:118
	qw422016.N().S(`
    </select>
    <label for="`)
//line inputs.qtpl:120
	qw422016.E().S(id)
//line inputs.qtpl:120
	qw422016.N().S(`">`)
//line inputs.qtpl:120
	qw422016.E().S(c.label)
//line inputs.qtpl:120
	qw422016.N().S(`</label>
</div>
`)
//line inputs.qtpl:122
}

//line inputs.qtpl:122
func writemakeSelect(qq422016 qtio422016.Writer, c selectConfig) {
//line inputs.qtpl:122
	qw422016 := qt422016.AcquireWriter(qq422016)
//line inputs.qtpl:122
	streammakeSelect(qw422016, c)
//line inputs.qtpl:122
	qt422016.ReleaseWriter(qw422016)
//line inputs.qtpl:122
}

//line inputs.qtpl:122
func makeSelect(c selectConfig) string {
//line inputs.qtpl:122
	qb422016 := qt422016.AcquireByteBuffer()
//line inputs.qtpl:122
	writemakeSelect(qb422016, c)
//line inputs.qtpl:122
	qs422016 := string(qb422016.B)
//line inputs.qtpl:122
	qt422016.ReleaseByteBuffer(qb422016)
//line inputs.qtpl:122
	return qs422016
//line inputs.qtpl:122
}

//line inputs.qtpl:124
func streammakeStrDatalistInput(qw422016 *qt422016.Writer, c strDatalistInputConfig) {
//line inputs.qtpl:124
	qw422016.N().S(`
`)
//line inputs.qtpl:125
	id := makeInputID(c.data.Name)

//line inputs.qtpl:125
	qw422016.N().S(`
`)
//line inputs.qtpl:126
	datalistID := id + "-datalist"

//line inputs.qtpl:126
	qw422016.N().S(`
<div class="input-field `)
//line inputs.qtpl:127
	qw422016.E().S(c.wraperClass)
//line inputs.qtpl:127
	qw422016.N().S(`">
    <input
        id="`)
//line inputs.qtpl:129
	qw422016.E().S(id)
//line inputs.qtpl:129
	qw422016.N().S(`"
        list="`)
//line inputs.qtpl:130
	qw422016.E().S(datalistID)
//line inputs.qtpl:130
	qw422016.N().S(`"

        `)
//line inputs.qtpl:132
	if c.disabled {
//line inputs.qtpl:132
		qw422016.N().S(`
        disabled
        `)
//line inputs.qtpl:134
	}
//line inputs.qtpl:134
	qw422016.N().S(`

        `)
//line inputs.qtpl:136
	if c.required {
//line inputs.qtpl:136
		qw422016.N().S(`
        required
        `)
//line inputs.qtpl:138
	}
//line inputs.qtpl:138
	qw422016.N().S(`

        type="text"
        class="validate"
        `)
//line inputs.qtpl:142
	if c.data.Name != "" {
//line inputs.qtpl:142
		qw422016.N().S(`
        name="`)
//line inputs.qtpl:143
		qw422016.E().S(c.data.Name)
//line inputs.qtpl:143
		qw422016.N().S(`"
        `)
//line inputs.qtpl:144
	}
//line inputs.qtpl:144
	qw422016.N().S(`
        value="`)
//line inputs.qtpl:145
	qw422016.E().S(c.data.Value)
//line inputs.qtpl:145
	qw422016.N().S(`"
    >
    <label for="`)
//line inputs.qtpl:147
	qw422016.E().S(id)
//line inputs.qtpl:147
	qw422016.N().S(`">`)
//line inputs.qtpl:147
	qw422016.E().S(c.label)
//line inputs.qtpl:147
	qw422016.N().S(`</label>

    <datalist id="`)
//line inputs.qtpl:149
	qw422016.E().S(datalistID)
//line inputs.qtpl:149
	qw422016.N().S(`">
        `)
//line inputs.qtpl:150
	for _, option := range c.data.Options {
//line inputs.qtpl:150
		qw422016.N().S(`
        <option value="`)
//line inputs.qtpl:151
		qw422016.E().S(option)
//line inputs.qtpl:151
		qw422016.N().S(`"></option>
        `)
//line inputs.qtpl:152
	}
//line inputs.qtpl:152
	qw422016.N().S(`
    </datalist>	
</div>
`)
//line inputs.qtpl:155
}

//line inputs.qtpl:155
func writemakeStrDatalistInput(qq422016 qtio422016.Writer, c strDatalistInputConfig) {
//line inputs.qtpl:155
	qw422016 := qt422016.AcquireWriter(qq422016)
//line inputs.qtpl:155
	streammakeStrDatalistInput(qw422016, c)
//line inputs.qtpl:155
	qt422016.ReleaseWriter(qw422016)
//line inputs.qtpl:155
}

//line inputs.qtpl:155
func makeStrDatalistInput(c strDatalistInputConfig) string {
//line inputs.qtpl:155
	qb422016 := qt422016.AcquireByteBuffer()
//line inputs.qtpl:155
	writemakeStrDatalistInput(qb422016, c)
//line inputs.qtpl:155
	qs422016 := string(qb422016.B)
//line inputs.qtpl:155
	qt422016.ReleaseByteBuffer(qb422016)
//line inputs.qtpl:155
	return qs422016
//line inputs.qtpl:155
}

//line inputs.qtpl:157
func streammakeChipsInput(qw422016 *qt422016.Writer, c chipsInputConfig) {
//line inputs.qtpl:157
	qw422016.N().S(`
`)
//line inputs.qtpl:158
	chipsId := makeInputID(c.data.Name)

//line inputs.qtpl:158
	qw422016.N().S(`
`)
//line inputs.qtpl:159
	inputId := makeInputID(c.data.Name) + "-input"

//line inputs.qtpl:159
	qw422016.N().S(`
<div class="`)
//line inputs.qtpl:160
	qw422016.E().S(c.wraperClass)
//line inputs.qtpl:160
	qw422016.N().S(`">
    <div id="`)
//line inputs.qtpl:161
	qw422016.E().S(chipsId)
//line inputs.qtpl:161
	qw422016.N().S(`" class="chips"></div>
    <input id="`)
//line inputs.qtpl:162
	qw422016.E().S(inputId)
//line inputs.qtpl:162
	qw422016.N().S(`" type="hidden" name="tags" />
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var input = document.getElementById('`)
//line inputs.qtpl:165
	qw422016.E().J(inputId)
//line inputs.qtpl:165
	qw422016.N().S(`');
            var elem = document.getElementById('`)
//line inputs.qtpl:166
	qw422016.E().J(chipsId)
//line inputs.qtpl:166
	qw422016.N().S(`');

            var selectedValues = [
`)
//line inputs.qtpl:169
	for i, value := range c.data.Values {
//line inputs.qtpl:169
		qw422016.N().S(`                    '`)
//line inputs.qtpl:170
		qw422016.E().J(value)
//line inputs.qtpl:170
		qw422016.N().S(`'`)
//line inputs.qtpl:170
		if i < len(c.data.Values)-1 {
//line inputs.qtpl:170
			qw422016.N().S(`,`)
//line inputs.qtpl:170
		}
//line inputs.qtpl:170
		qw422016.N().S(`
`)
//line inputs.qtpl:171
	}
//line inputs.qtpl:171
	qw422016.N().S(`            ];
            var allValues = [
`)
//line inputs.qtpl:174
	for i, value := range c.data.Autocomplete {
//line inputs.qtpl:174
		qw422016.N().S(`                    '`)
//line inputs.qtpl:175
		qw422016.E().J(value)
//line inputs.qtpl:175
		qw422016.N().S(`'`)
//line inputs.qtpl:175
		if i < len(c.data.Autocomplete)-1 {
//line inputs.qtpl:175
			qw422016.N().S(`,`)
//line inputs.qtpl:175
		}
//line inputs.qtpl:175
		qw422016.N().S(`
`)
//line inputs.qtpl:176
	}
//line inputs.qtpl:176
	qw422016.N().S(`            ];

            function updateTagsInput() {
                input.value = instance.chipsData.map(function(data) {
                    return data.tag
                }).join(',')
            }
            var instance = M.Chips.init(elem, {
                data: selectedValues.map((tag) => ({
                    tag,
                })),
                autocompleteOptions: {
                    data: allValues.reduce((acc, val) => {
                        acc[val] = null
                        return acc
                    }, {}),
                    limit: Infinity,
                    minLength: 1
                },
                onChipAdd: updateTagsInput,
                onChipDelete: updateTagsInput,
            });
            updateTagsInput()
        });
    </script>
</div>
`)
//line inputs.qtpl:203
}

//line inputs.qtpl:203
func writemakeChipsInput(qq422016 qtio422016.Writer, c chipsInputConfig) {
//line inputs.qtpl:203
	qw422016 := qt422016.AcquireWriter(qq422016)
//line inputs.qtpl:203
	streammakeChipsInput(qw422016, c)
//line inputs.qtpl:203
	qt422016.ReleaseWriter(qw422016)
//line inputs.qtpl:203
}

//line inputs.qtpl:203
func makeChipsInput(c chipsInputConfig) string {
//line inputs.qtpl:203
	qb422016 := qt422016.AcquireByteBuffer()
//line inputs.qtpl:203
	writemakeChipsInput(qb422016, c)
//line inputs.qtpl:203
	qs422016 := string(qb422016.B)
//line inputs.qtpl:203
	qt422016.ReleaseByteBuffer(qb422016)
//line inputs.qtpl:203
	return qs422016
//line inputs.qtpl:203
}