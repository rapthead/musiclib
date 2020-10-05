package models

import (
	"bytes"
	"io"
	"syscall"
	"time"
)

type ContentFile struct {
	readerAt io.ReaderAt
	size     uint64
}

func NewContentFile(content []byte) *ContentFile {
	return &ContentFile{bytes.NewReader(content), uint64(len(content))}
}

func (f *ContentFile) Close() error {
	return nil
}

func (f *ContentFile) ReadAt(buf []byte, off int64) (int, error) {
	return f.readerAt.ReadAt(buf, off)
}

func (f *ContentFile) ATime() *time.Time {
	return nil
}

func (f *ContentFile) CTime() *time.Time {
	return nil
}

func (f *ContentFile) MTime() *time.Time {
	return nil
}

func (f *ContentFile) Mode() uint32 {
	return syscall.S_IFREG | 0644
}

func (f *ContentFile) Size() uint64 {
	return f.size
}
