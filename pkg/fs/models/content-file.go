package models

import (
	"bytes"
	"syscall"
	"time"
)

type ContentFile struct {
	reader *bytes.Reader
}

func NewContentFile(content []byte) *ContentFile {
	return &ContentFile{bytes.NewReader(content)}
}

func (f *ContentFile) Close() error {
	return nil
}

func (f *ContentFile) ReadAt(buf []byte, off int64) (int, error) {
	return f.reader.ReadAt(buf, off)
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

func (f *ContentFile) Size() int64 {
	return f.reader.Size()
}
