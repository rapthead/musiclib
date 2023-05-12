package models

import (
	"bytes"
	"io"
	"os"
	"syscall"
	"time"

	"go4.org/readerutil"
)

type FlacFile struct {
	cTime time.Time
	mTime time.Time

	closer       io.Closer
	sizeReaderAt readerutil.SizeReaderAt
}

func NewFlacFile(fp FlacData) (*FlacFile, error) {
	fsFile, err := os.Open(fp.OriginPath)
	if err != nil {
		return nil, err
	}

	_, err = fsFile.Stat()
	if err != nil {
		return nil, err
	}

	r := readerutil.NewMultiReaderAt(
		io.NewSectionReader(
			fsFile,
			0,
			fp.ReplacementStart,
		),
		// io.NewSectionReader(
		// 	fsFile,
		// 	fp.ReplacementStart,
		// 	fp.ReplacementEnd-fp.ReplacementStart,
		// ),
		bytes.NewReader(fp.MetaBlock),
		// io.NewSectionReader(
		// 	fsFile,
		// 	fp.ReplacementEnd,
		// 	stat.Size()-fp.ReplacementEnd,
		// ),
	)
	// sections := []*io.SectionReader{
	// 	io.NewSectionReader(
	// 		fsFile,
	// 		0,
	// 		fp.ReplacementStart,
	// 	),
	// 	io.NewSectionReader(
	// 		bytes.NewReader(fp.MetaBlock),
	// 		0,
	// 		int64(len(fp.MetaBlock)),
	// 	),
	// 	io.NewSectionReader(
	// 		fsFile,
	// 		fp.ReplacementEnd,
	// 		stat.Size()-fp.ReplacementEnd,
	// 	),
	// }

	f := FlacFile{
		fp.CTime,
		fp.MTime,

		fsFile,
		r,
	}
	return &f, nil
}

func (f *FlacFile) Close() error {
	return f.closer.Close()
}

func (f *FlacFile) ReadAt(buf []byte, off int64) (int, error) {
	return f.sizeReaderAt.ReadAt(buf, off)
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

func (f *FlacFile) Size() int64 {
	return f.sizeReaderAt.Size()
}
