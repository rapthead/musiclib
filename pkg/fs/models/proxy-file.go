package models

import (
	"os"
	"sync"
	"syscall"
	"time"
)

type ProxyFile struct {
	lock   sync.Mutex
	fsFile *os.File

	stat os.FileInfo
}

func NewProxyFile(path string) (*ProxyFile, error) {
	fsFile, err := os.Open(path)
	if err != nil {
		return nil, err
	}

	stat, err := fsFile.Stat()
	if err != nil {
		return nil, err
	}

	f := ProxyFile{
		sync.Mutex{},
		fsFile,
		stat,
	}
	return &f, nil
}

func (f *ProxyFile) Close() error {
	f.lock.Lock()
	err := f.fsFile.Close()
	f.lock.Unlock()
	return err
}

func (f *ProxyFile) ReadAt(buf []byte, off int64) (int, error) {
	return f.fsFile.ReadAt(buf, off)
}

func (f *ProxyFile) ATime() *time.Time {
	atime := f.stat.ModTime()
	return &atime
}

func (f *ProxyFile) CTime() *time.Time {
	atime := f.stat.ModTime()
	return &atime
}

func (f *ProxyFile) MTime() *time.Time {
	atime := f.stat.ModTime()
	return &atime
}

func (f *ProxyFile) Mode() uint32 {
	return syscall.S_IFREG | 0644
}

func (f *ProxyFile) Size() uint64 {
	return uint64(f.stat.Size())
}
