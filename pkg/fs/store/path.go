package store

import (
	"path"
	"strings"
)

type fusePath string

func (p fusePath) Path() string {
	return string(p)
}

func (p fusePath) Parent() (parent IFusePath) {
	dir := path.Dir(string(p))
	if dir == "." {
		parent = fuseRoot{}
	} else {
		parent = fusePath(dir)
	}
	return
}

func (p fusePath) Base() string {
	return path.Base(string(p))
}

type fuseRoot struct{}

func (p fuseRoot) Path() string {
	return ""
}

func (p fuseRoot) Parent() IFusePath {
	return nil
}

func (p fuseRoot) Base() string {
	return ""
}

type IFusePath interface {
	Path() string
	Base() string
	Parent() IFusePath
}

func NewFusePath(rawPath string) IFusePath {
	if strings.Trim(rawPath, "/") != rawPath {
		panic("assertion error: expected relative path, got " + rawPath)
	}
	if path.Clean(rawPath) != rawPath {
		panic("assertion error: fuse path is not clean " + rawPath)
	}
	return fusePath(rawPath)
}
