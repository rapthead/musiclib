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

// package main
//
// import (
// 	"bytes"
// 	"fmt"
// 	"go/ast"
// 	"go/constant"
// 	"go/format"
// 	"go/importer"
// 	"go/parser"
// 	"go/token"
// 	"go/types"
// 	"log"
// 	"strings"
// )
//
// //!+input
// const input = `
// package models
//
// type DownloadSourceEnum string
//
// const DownloadSourceEnumMY DownloadSourceEnum = "MY"
// const DownloadSourceEnumWHATCD DownloadSourceEnum = "WHAT_CD"
//
// type CoverTypeEnum string
//
// const (
// 	CoverTypeEnumBackOut  CoverTypeEnum = "back out"
// 	CoverTypeEnumFrontOut               = "front out"
// 	CoverTypeEnumBackIn                 = "back in"
// 	CoverTypeEnumFrontIn                = "front in"
// 	CoverTypeEnumDisc                   = "disc"
// 	CoverTypeEnumIn                     = "in"
// 	CoverTypeEnumOut                    = "out"
// 	CoverTypeEnumBooklet                = "booklet"
// 	CoverTypeEnumOther                  = "other"
// )
//
// const DownloadSourceEnumWAFFLESFM DownloadSourceEnum = "WAFFLES_FM"
// const DownloadSourceEnumREDACTEDCH DownloadSourceEnum = "REDACTED_CH"
// const DownloadSourceEnumWEB DownloadSourceEnum = "WEB"
// `
//
// //!-input
//
// var fset = token.NewFileSet()
//
// func main() {
// 	f, err := parser.ParseFile(fset, "hello.go", input, 0)
// 	if err != nil {
// 		log.Fatal(err) // parse error
// 	}
//
// 	conf := types.Config{Importer: importer.Default()}
// 	info := &types.Info{Types: make(map[ast.Expr]types.TypeAndValue)}
// 	if _, err := conf.Check("cmd/hello", fset, []*ast.File{f}, info); err != nil {
// 		log.Fatal(err) // type error
// 	}
//
// 	typeName := "DownloadSourceEnum"
// 	ast.Inspect(f, func(node ast.Node) bool {
// 		decl, ok := node.(*ast.GenDecl)
// 		if !ok || decl.Tok != token.CONST {
// 			// We only care about const declarations.
// 			return true
// 		}
//
// 		for _, spec := range decl.Specs {
// 			vspec := spec.(*ast.ValueSpec) // Guaranteed to succeed as this is CONST.
// 			fmt.Printf("%+v\n", vspec)
// 		}
//
// 		// The name of the type of the constants we are declaring.
// 		// Can change if this is a multi-element declaration.
// 		typ := ""
// 		// Loop over the elements of the declaration. Each element is a ValueSpec:
// 		// a list of names possibly followed by a type, possibly followed by values.
// 		// If the type and value are both missing, we carry down the type (and value,
// 		// but the "go/types" package takes care of that).
// 		for _, spec := range decl.Specs {
// 			vspec := spec.(*ast.ValueSpec) // Guaranteed to succeed as this is CONST.
// 			if vspec.Type == nil && len(vspec.Values) > 0 {
// 				// "X = 1". With no type but a value. If the constant is untyped,
// 				// skip this vspec and reset the remembered type.
// 				typ = ""
//
// 				// If this is a simple type conversion, remember the type.
// 				// We don't mind if this is actually a call; a qualified call won't
// 				// be matched (that will be SelectorExpr, not Ident), and only unusual
// 				// situations will result in a function call that appears to be
// 				// a type conversion.
// 				ce, ok := vspec.Values[0].(*ast.CallExpr)
// 				if !ok {
// 					continue
// 				}
// 				id, ok := ce.Fun.(*ast.Ident)
// 				if !ok {
// 					continue
// 				}
// 				typ = id.Name
// 			}
// 			if vspec.Type != nil {
// 				// "X T". We have a type. Remember it.
// 				ident, ok := vspec.Type.(*ast.Ident)
// 				if !ok {
// 					continue
// 				}
// 				typ = ident.Name
// 			}
// 			if typ != typeName {
// 				// This is not the type we're looking for.
// 				continue
// 			}
// 			// We now have a list of names (from one line of source code) all being
// 			// declared with the desired type.
// 			// Grab their names and actual values and store them in f.values.
// 			for _, name := range vspec.Names {
// 				if name.Name == "_" {
// 					continue
// 				}
// 				// This dance lets the type checker find the values for us. It's a
// 				// bit tricky: look up the object declared by the name, find its
// 				// types.Const, and extract its value.
// 				obj, ok := f.pkg.defs[name]
// 				if !ok {
// 					log.Fatalf("no value for constant %s", name)
// 				}
// 				info := obj.Type().Underlying().(*types.Basic).Info()
// 				if info&types.IsInteger == 0 {
// 					log.Fatalf("can't handle non-integer constant type %s", typ)
// 				}
// 				value := obj.(*types.Const).Val() // Guaranteed to succeed as this is CONST.
// 				if value.Kind() != constant.Int {
// 					log.Fatalf("can't happen: constant is not an integer %s", name)
// 				}
// 				i64, isInt := constant.Int64Val(value)
// 				u64, isUint := constant.Uint64Val(value)
// 				if !isInt && !isUint {
// 					log.Fatalf("internal error: value of %s is not an integer: %s", name, value.String())
// 				}
// 				if !isInt {
// 					u64 = uint64(i64)
// 				}
// 				v := Value{
// 					originalName: name.Name,
// 					value:        u64,
// 					signed:       info&types.IsUnsigned == 0,
// 					str:          value.String(),
// 				}
// 				if c := vspec.Comment; f.lineComment && c != nil && len(c.List) == 1 {
// 					v.name = strings.TrimSpace(c.Text())
// 				} else {
// 					v.name = strings.TrimPrefix(v.originalName, f.trimPrefix)
// 				}
// 				f.values = append(f.values, v)
// 			}
// 		}
// 		return false
// 	})
// 	//!-inspect
// }
//
// // nodeString formats a syntax tree in the style of gofmt.
// func nodeString(n ast.Node) string {
// 	var buf bytes.Buffer
// 	format.Node(&buf, fset, n)
// 	return buf.String()
// }
//
// // mode returns a string describing the mode of an expression.
// func mode(tv types.TypeAndValue) string {
// 	s := ""
// 	if tv.IsVoid() {
// 		s += ",void"
// 	}
// 	if tv.IsType() {
// 		s += ",type"
// 	}
// 	if tv.IsBuiltin() {
// 		s += ",builtin"
// 	}
// 	if tv.IsValue() {
// 		s += ",value"
// 	}
// 	if tv.IsNil() {
// 		s += ",nil"
// 	}
// 	if tv.Addressable() {
// 		s += ",addressable"
// 	}
// 	if tv.Assignable() {
// 		s += ",assignable"
// 	}
// 	if tv.HasOk() {
// 		s += ",ok"
// 	}
// 	return s[1:]
// }

/*
//!+output
$ go build github.com/golang/example/gotypes/typeandvalue
$ ./typeandvalue
make(map[string]int)            mode:  value
                                type:  map[string]int
make                            mode:  builtin
                                type:  func(map[string]int) map[string]int
map[string]int                  mode:  type
                                type:  map[string]int
string                          mode:  type
                                type:  string
int                             mode:  type
                                type:  int
m["hello, "+"world"]            mode:  value,assignable,ok
                                type:  (int, bool)
m                               mode:  value,addressable,assignable
                                type:  map[string]int
"hello, " + "world"             mode:  value
                                type:  string
                                value: "hello, world"
"hello, "                       mode:  value
                                type:  untyped string
                                value: "hello, "
"world"                         mode:  value
                                type:  untyped string
                                value: "world"
print(rune(v), ok)              mode:  void
                                type:  ()
print                           mode:  builtin
                                type:  func(rune, bool)
rune(v)                         mode:  value
                                type:  rune
rune                            mode:  type
                                type:  rune
...more not shown...
//!-output
*/

// package main
//
// import (
// 	"fmt"
// 	"go/ast"
// 	"go/parser"
// 	"go/token"
// )
//
// type enumValue struct {
// 	Name  string
// 	Value string
// }
//
// type enumStrType struct {
// 	Name   string
// 	Values []enumValue
// }
//
// func main() {
// 	// src := `
// 	//     package foo
//
// 	//     type Thing struct {
// 	//         Field1 string
// 	//         Field2 []int
// 	//         Field3 map[byte]float64
// 	//     }
// 	// `
// 	src := `
// 	    package foo
//
// 	    type CoverTypeEnum string
//
// 	    const (
// 	        CoverTypeEnumBackOut  CoverTypeEnum = "back out"
// 	        CoverTypeEnumFrontOut CoverTypeEnum = "front out"
// 	        CoverTypeEnumBackIn   CoverTypeEnum = "back in"
// 	        CoverTypeEnumFrontIn  CoverTypeEnum = "front in"
// 	        CoverTypeEnumDisc     CoverTypeEnum = "disc"
// 	        CoverTypeEnumIn       CoverTypeEnum = "in"
// 	        CoverTypeEnumOut      CoverTypeEnum = "out"
// 	        CoverTypeEnumBooklet  CoverTypeEnum = "booklet"
// 	        CoverTypeEnumOther    CoverTypeEnum = "other"
// 	    )
// 	`
//
// 	fset := token.NewFileSet()
// 	f, err := parser.ParseFile(fset, "", src, 0)
//
// 	if err != nil {
// 		panic(err)
// 	}
//
// 	typeDecl := f.Decls[1].(*ast.GenDecl)
// 	typeLit := typeDecl.Specs[0].(*ast.ValueSpec).Values[0].(*ast.BasicLit)
// 	fmt.Printf("%+v\n", typeLit.Value)
// 	// typeSpec := typeDecl.Specs[0].(*ast.TypeSpec)
// 	// fmt.Println(typeSpec.Name.Name)
// 	// fmt.Println(typeSpec.Type.(*ast.Ident).Name)
// 	// fmt.Printf("%v\n", typeDecl.Specs[0].(*ast.TypeSpec).Type.(*ast.Ident).Name)
// 	// structDecl := typeDecl.Specs[0].(*ast.TypeSpec).Type.(*ast.StructType)
// 	// fields := structDecl.Fields.List
//
// 	// for _, field := range fields {
// 	// 	typeExpr := field.Type
//
// 	// 	start := typeExpr.Pos() - 1
// 	// 	end := typeExpr.End() - 1
//
// 	// 	// grab it in source
// 	// 	typeInSource := src[start:end]
//
// 	// 	fmt.Println(typeInSource)
// 	// }
// }

// package main
//
// import (
// 	"flag"
// 	"fmt"
// 	"os"
//
// 	"golang.org/x/tools/go/packages"
// )
//
// func main() {
// 	flag.Parse()
//
// 	// Many tools pass their command-line arguments (after any flags)
// 	// uninterpreted to packages.Load so that it can interpret them
// 	// according to the conventions of the underlying build system.
// 	patterns := flag.Args()
// 	cfg := &packages.Config{
// 		Mode:  packages.LoadSyntax,
// 		Tests: false,
// 	}
// 	pkgs, err := packages.Load(cfg, patterns...)
// 	if err != nil {
// 		fmt.Fprintf(os.Stderr, "load: %v\n", err)
// 		os.Exit(1)
// 	}
// 	if packages.PrintErrors(pkgs) > 0 {
// 		fmt.Print("package have errors")
// 		os.Exit(1)
// 	}
//
// 	// Print the names of the source files
// 	// for each package listed on the command line.
// 	for _, pkg := range pkgs {
// 		fmt.Printf(
// 			"%+v\n",
// 			pkg.TypesInfo.Defs[""],
// 		)
// 	}
// }
