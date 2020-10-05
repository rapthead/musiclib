package models

import (
	"io"
	"time"
)

type Visitor interface {
	VisitDirectory(Directory)
	VisitFile(File)
}

type FSItem interface {
	Size() uint64
	Mode() uint32
	ATime() *time.Time
	MTime() *time.Time
	CTime() *time.Time
}

type File interface {
	io.ReaderAt
	io.Closer
	FSItem
}

// директория
type Directory struct {
	Items []DirItem
}

func (d Directory) Accept(v Visitor) {
	v.VisitDirectory(d)
}

type DirItem interface {
	Name() string
	Mode() uint32
}
