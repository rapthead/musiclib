package main

import (
	"bytes"
	"flag"
	"fmt"
	"go/format"
	"html/template"
	"io/ioutil"
	"log"
	"os"
	"strings"

	"github.com/rapthead/musiclib/cmd/enumer/parser"
)

type templateData struct {
	Package        string
	EnumTypeName   string
	EnumConstNames []string
	StringsJoin    func([]string, string) string
}

var tmpl = template.Must(template.New("generic").Parse(`
package {{.Package}}

import (
	"fmt"

	"github.com/rapthead/musiclib/views"
)

var All{{.EnumTypeName}} = []{{.EnumTypeName}}{
    {{call .StringsJoin .EnumConstNames ",\n"}},
}

func (e {{.EnumTypeName}}) IsValid() bool {
	switch e {
	case
        {{call .StringsJoin .EnumConstNames ",\n"}}:
		return true
	}
	return false
}

func (e *{{.EnumTypeName}}) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = {{.EnumTypeName}}(s)
	case string:
		*e = {{.EnumTypeName}}(s)
	default:
		return fmt.Errorf("unsupported scan type for {{.EnumTypeName}}: %T", src)
	}
	return nil
}

func (e {{.EnumTypeName}}) SelectInput(fieldName string) views.SelectInputData {
	allEnumValues := All{{.EnumTypeName}}

	options := make([]views.SelectOption, len(allEnumValues), len(allEnumValues))
	for i, enumValue := range allEnumValues {
		options[i] = views.SelectOption{
			Label:    string(enumValue),
			Value:    string(enumValue),
			Selected: enumValue == e,
		}
	}
	return views.SelectInputData{
		Name:    fieldName,
		Options: options,
	}
}
`))

var (
	typeName   = flag.String("type", "", "enum type name")
	outputName = flag.String("output", "", "output file name; default srcdir/<type>_enumer.go")
)

func Usage() {
	fmt.Fprintf(os.Stderr, "Usage of enumer:\n")
	fmt.Fprintf(os.Stderr, "\tenumer -output T_enumer.go -type T github.com/rapthead/musiclib/models\n")
	fmt.Fprintf(os.Stderr, "Flags:\n")
	flag.PrintDefaults()
}

func main() {
	flag.Usage = Usage
	flag.Parse()

	args := flag.Args()
	if len(args) != 1 || *typeName == "" {
		flag.Usage()
		os.Exit(2)
	}

	pkgAdr := args[0]
	pkg, err := parser.ParsePackage(pkgAdr)
	if err != nil {
		log.Fatal(err)
	}

	enumTypeName := *typeName
	enumConstNames, err := pkg.ValuesOfType(enumTypeName)
	if err != nil {
		log.Fatal(err)
	}

	var source bytes.Buffer
	err = tmpl.Execute(&source, templateData{
		Package:        pkg.Name,
		EnumTypeName:   enumTypeName,
		EnumConstNames: enumConstNames,
		StringsJoin:    strings.Join,
	})

	if err != nil {
		log.Fatal(err)
	}
	formatedSrc, err := format.Source(source.Bytes())
	if err != nil {
		log.Fatal(err)
	}

	err = ioutil.WriteFile(*outputName, formatedSrc, 0644)
	if err != nil {
		log.Fatalf("writing output: %s", err)
	}
}
