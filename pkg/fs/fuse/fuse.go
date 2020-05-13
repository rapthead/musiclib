package fuse

import (
	"bytes"
	"io"
	"os"
	"os/signal"
	"sync"
	"syscall"

	"github.com/go-redis/redis/v7"
	"github.com/hanwen/go-fuse/fuse"
	"github.com/hanwen/go-fuse/fuse/nodefs"
	"github.com/hanwen/go-fuse/fuse/pathfs"
	log "github.com/sirupsen/logrus"

	"github.com/rapthead/musiclib/pkg/fs/store"
)

type flacFile struct {
	nodefs.File
	lock   sync.Mutex
	fsFile *os.File
	logger *log.Entry

	sections []*io.SectionReader
}

func newFlacFile(fp store.FlacData, logger *log.Entry) (*flacFile, error) {
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

	f := flacFile{
		nodefs.NewReadOnlyFile(nodefs.NewDefaultFile()),
		sync.Mutex{},
		fsFile,
		logger,
		sections,
	}
	return &f, nil
}

func (f *flacFile) Release() {
	f.lock.Lock()
	f.fsFile.Close()
	f.lock.Unlock()
}

func (f *flacFile) Read(buf []byte, off int64) (fuse.ReadResult, fuse.Status) {
	f.lock.Lock()
	defer f.lock.Unlock()

	readers := make([]io.Reader, 0, len(f.sections))
	var position int64
	for _, section := range f.sections {
		if section.Size()+position > off {
			if off-position > 0 {
				_, err := section.Seek(off-position, io.SeekStart)
				if err != nil {
					panic(err)
				}
			}
			readers = append(readers, section)
		}
		position += section.Size()
	}
	r := io.MultiReader(readers...)

	n, err := io.ReadFull(r, buf)
	if err != nil && err != io.EOF && err != io.ErrUnexpectedEOF {
		f.logger.
			WithField("readed bytes", n).
			WithField("offset", off).
			WithField("len(buf)", len(buf)).
			WithError(err).
			Error("reading error")
		return nil, fuse.EIO
	}

	res := fuse.ReadResultData(buf)
	return res, fuse.OK
}

type MusiclibFS struct {
	pathfs.FileSystem
	store  store.FuseStore
	logger *log.Entry
}

func NewMusiclibFS(fuseStore store.FuseStore, logger *log.Entry) *MusiclibFS {
	return &MusiclibFS{
		pathfs.NewDefaultFileSystem(),
		fuseStore,
		logger,
	}
}

func (s *MusiclibFS) GetAttr(name string, context *fuse.Context) (*fuse.Attr, fuse.Status) {
	logEntry := s.logger.WithField("name", name)
	logEntry.Debug("GetAttr")
	fsType, err := s.store.Type(name)
	if err != nil {
		if err == store.NotFound {
			return nil, fuse.ENOENT
		}
		return nil, fuse.EIO
	}

	switch fsType {
	case store.DIR:
		return &fuse.Attr{
			Mode: fuse.S_IFDIR | 0755,
		}, fuse.OK
	case store.FLAC_FILE:
		fileProps, err := s.store.GetFlacProps(name)
		if err == nil {
			return &fuse.Attr{
				Mode: fuse.S_IFREG | 0644, Size: fileProps.Size,
			}, fuse.OK
		}
	}
	return nil, fuse.EIO
}

func (s *MusiclibFS) OpenDir(name string, context *fuse.Context) (c []fuse.DirEntry, code fuse.Status) {
	logEntry := s.logger.WithField("name", name)
	items, err := s.store.ListDir(name)
	if err != nil {
		logEntry.WithError(err).Error("list dir error")
	}

	c = []fuse.DirEntry{}
	for _, item := range items {
		var dirEntry fuse.DirEntry
		switch item.Type {
		case store.DIR:
			dirEntry = fuse.DirEntry{Name: item.Name, Mode: fuse.S_IFREG}
		case store.FLAC_FILE:
			dirEntry = fuse.DirEntry{Name: item.Name, Mode: fuse.S_IFDIR}
		default:
			panic("assertion error unknow dirEntry type: " + string(item.Type))
		}
		c = append(c, dirEntry)
	}

	logEntry = logEntry.WithField("items", items)
	logEntry = logEntry.WithField("dirEntries", c)
	logEntry.Debug("OpenDir")
	return c, fuse.OK
}

func (s *MusiclibFS) Open(name string, flags uint32, context *fuse.Context) (file nodefs.File, code fuse.Status) {
	fileProps, err := s.store.GetFlacProps(name)
	if err != nil {
		return nil, fuse.ENOENT
	}

	flacFile, err := newFlacFile(fileProps, s.logger.WithField("flacFile", name))
	if err != nil {
		return nil, fuse.ENOENT
	}

	return flacFile, fuse.OK
}

func Mount(rdb *redis.Client, logger *log.Entry, mountPoint string) {
	logger.Debug("Mount")
	fuseStore := store.NewFuseStore(rdb)
	nfs := pathfs.NewPathNodeFs(NewMusiclibFS(fuseStore, logger), nil)

	conn := nodefs.NewFileSystemConnector(nfs.Root(), nil)
	mountOpts := fuse.MountOptions{
		AllowOther: true,
	}
	server, err := fuse.NewServer(conn.RawFS(), mountPoint, &mountOpts)
	if err != nil {
		logger.WithError(err).Fatal("mount error")
	}

	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)
	go func() {
		<-sigs
		server.Unmount()
		os.Exit(0)
	}()

	server.Serve()
}
