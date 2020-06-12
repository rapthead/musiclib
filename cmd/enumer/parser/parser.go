// Copyright 2017 Google Inc. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to writing, software distributed
// under the License is distributed on a "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.
//
// See the License for the specific language governing permissions and
// limitations under the License.

// Package parser parses Go code and keeps track of all the types defined
// and provides access to all the constants defined for an int type.
package parser

import (
	"fmt"
	"go/ast"
	"go/constant"
	"go/token"
	"go/types"
	"log"
	"strings"

	"golang.org/x/tools/go/packages"
)

// A Package contains all the information related to a parsed package.
type Package struct {
	Name  string
	files []*ast.File

	defs map[*ast.Ident]types.Object
}

// ParsePackage parses the package in the given directory and returns it.
func ParsePackage(pattern string) (*Package, error) {
	cfg := &packages.Config{
		Mode:  packages.LoadAllSyntax,
		Tests: false,
	}
	pkgs, err := packages.Load(cfg, pattern)
	if err != nil {
		log.Fatal(err)
	}
	if len(pkgs) != 1 {
		log.Fatalf("error: %d packages found", len(pkgs))
	}

	pkgInfo := pkgs[0]
	return &Package{
		Name:  pkgInfo.Name,
		files: pkgInfo.Syntax,
		defs:  pkgInfo.TypesInfo.Defs,
	}, nil

	// p, err := build.ImportDir(directory, build.FindOnly)
	// if err != nil {
	// 	return nil, fmt.Errorf("provided directory (%s) may not under GOPATH (%s): %v",
	// 		directory, build.Default.GOPATH, err)
	// }

	// conf := loader.Config{TypeChecker: types.Config{FakeImportC: true}}
	// conf.Import(p.ImportPath)
	// program, err := conf.Load()
	// if err != nil {
	// 	return nil, fmt.Errorf("couldn't load package: %v", err)
	// }

	// pkgInfo := program.Package(p.ImportPath)
	// return &Package{
	// 	Name:  pkgInfo.Pkg.Name(),
	// 	files: pkgInfo.Files,
	// 	defs:  pkgInfo.Defs,
	// }, nil
}

// generate produces the String method for the named type.
func (pkg *Package) ValuesOfType(typeName string) ([]string, error) {
	var values, inspectErrs []string
	for _, file := range pkg.files {
		ast.Inspect(file, func(node ast.Node) bool {
			decl, ok := node.(*ast.GenDecl)
			if !ok || decl.Tok != token.CONST {
				// We only care about const declarations.
				return true
			}

			if vs, err := pkg.valuesOfTypeIn(typeName, decl); err != nil {
				inspectErrs = append(inspectErrs, err.Error())
			} else {
				values = append(values, vs...)
			}
			return false
		})
	}
	if len(inspectErrs) > 0 {
		return nil, fmt.Errorf("inspecting code:\n\t%v", strings.Join(inspectErrs, "\n\t"))
	}
	if len(values) == 0 {
		return nil, fmt.Errorf("no values defined for type %s", typeName)
	}
	return values, nil
}

func (pkg *Package) valuesOfTypeIn(typeName string, decl *ast.GenDecl) ([]string, error) {
	var values []string

	// The name of the type of the constants we are declaring.
	// Can change if this is a multi-element declaration.
	typ := ""
	// Loop over the elements of the declaration. Each element is a ValueSpec:
	// a list of names possibly followed by a type, possibly followed by values.
	// If the type and value are both missing, we carry down the type (and value,
	// but the "go/types" package takes care of that).
	for _, spec := range decl.Specs {
		vspec := spec.(*ast.ValueSpec) // Guaranteed to succeed as this is CONST.
		if vspec.Type == nil && len(vspec.Values) > 0 {
			// "X = 1". With no type but a value, the constant is untyped.
			// Skip this vspec and reset the remembered type.
			typ = ""
			continue
		}
		if vspec.Type != nil {
			// "X T". We have a type. Remember it.
			ident, ok := vspec.Type.(*ast.Ident)
			if !ok {
				continue
			}
			typ = ident.Name
		}
		if typ != typeName {
			// This is not the type we're looking for.
			continue
		}

		// We now have a list of names (from one line of source code) all being
		// declared with the desired type.
		// Grab their names and actual values and store them in f.values.
		for _, name := range vspec.Names {
			if name.Name == "_" {
				continue
			}
			// This dance lets the type checker find the values for us. It's a
			// bit tricky: look up the object declared by the name, find its
			// types.Const, and extract its value.
			obj, ok := pkg.defs[name]
			if !ok {
				return nil, fmt.Errorf("no value for constant %s", name)
			}
			info := obj.Type().Underlying().(*types.Basic).Info()
			if info&types.IsString == 0 {
				return nil, fmt.Errorf("can't handle non-string constant type %s", typ)
			}
			value := obj.(*types.Const).Val() // Guaranteed to succeed as this is CONST.
			if value.Kind() != constant.String {
				log.Fatalf("can't happen: constant is not an integer %s", name)
			}
			values = append(values, name.Name)
		}
	}
	return values, nil
}
