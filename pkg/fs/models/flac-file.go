package models

import (
	"bytes"
	"io"
	"os"
	"sync"
	"syscall"
	"time"
)

type FlacFile struct {
	lock   sync.Mutex
	fsFile *os.File

	size     uint64
	cTime    time.Time
	mTime    time.Time
	sections []*io.SectionReader
}

func NewFlacFile(fp FlacData) (*FlacFile, error) {
	fsFile, err := os.Open(fp.OriginPath)
	if err != nil {
		return nil, err
	}

	stat, err := fsFile.Stat()
	if err != nil {
		return nil, err
	}

	sections := []*io.SectionReader{
		io.NewSectionReader(
			fsFile,
			0,
			fp.ReplacementStart,
		),
		io.NewSectionReader(
			bytes.NewReader(fp.MetaBlock),
			0,
			int64(len(fp.MetaBlock)),
		),
		io.NewSectionReader(
			fsFile,
			fp.ReplacementEnd,
			stat.Size()-fp.ReplacementEnd,
		),
	}

	f := FlacFile{
		sync.Mutex{},
		fsFile,
		fp.Size,
		fp.CTime,
		fp.MTime,
		sections,
	}
	return &f, nil
}

func (f *FlacFile) Close() error {
	f.lock.Lock()
	err := f.fsFile.Close()
	f.lock.Unlock()
	return err
}

func (f *FlacFile) ReadAt(buf []byte, off int64) (int, error) {
	f.lock.Lock()
	defer f.lock.Unlock()

	readers := make([]io.Reader, 0, len(f.sections))
	var position int64
	for _, section := range f.sections {
		if section.Size()+position > off {
            var seekTo int64
			if off-position > 0 {
                seekTo = off-position
			} else {
                seekTo = 0
            }

            _, err := section.Seek(seekTo, io.SeekStart)
            if err != nil {
                panic(err)
            }
			readers = append(readers, section)
		}
		position += section.Size()
	}
	r := io.MultiReader(readers...)

	return io.ReadFull(r, buf)
}

func (f *FlacFile) ATime() *time.Time {
	return nil
}

func (f *FlacFile) CTime() *time.Time {
	return &f.cTime
}

func (f *FlacFile) MTime() *time.Time {
	return &f.mTime
}

func (f *FlacFile) Mode() uint32 {
	return syscall.S_IFREG | 0644
}

func (f *FlacFile) Size() uint64 {
	return f.size
}
