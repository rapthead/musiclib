package fuse

import (
	"context"
	"io"
	"os"
	"os/signal"
	"syscall"

	"github.com/go-redis/redis/v8"
	"github.com/hanwen/go-fuse/v2/fuse"
	"github.com/hanwen/go-fuse/v2/fuse/nodefs"
	"github.com/hanwen/go-fuse/v2/fuse/pathfs"
	log "github.com/sirupsen/logrus"

	"github.com/rapthead/musiclib/pkg/fs/models"
	"github.com/rapthead/musiclib/pkg/fs/store"
)

type fuseFile struct {
	nodefs.File
	file   models.File
	logger *log.Entry
}

func newFuseFile(file models.File, logger *log.Entry) *fuseFile {
	return &fuseFile{
		nodefs.NewReadOnlyFile(nodefs.NewDefaultFile()),
		file,
		logger,
	}
}

func (f *fuseFile) Release() {
	f.file.Close()
}

func (f *fuseFile) Read(buf []byte, off int64) (fuse.ReadResult, fuse.Status) {
	n, err := f.file.ReadAt(buf, off)

	if err != nil && err != io.EOF && err != io.ErrUnexpectedEOF {
		f.logger.
			WithField("readed bytes", n).
			WithField("offset", off).
			WithField("len(buf)", len(buf)).
			WithError(err).
			Error("reading error")
		return nil, fuse.EIO
	}

    f.logger.
        WithField("readed bytes", n).
        WithField("offset", off).
        WithField("len(buf)", len(buf)).
        Debug("read")

	res := fuse.ReadResultData(buf)
	return res, fuse.OK
}

type MusiclibFS struct {
	pathfs.FileSystem
	store  models.StoreFetcher
	logger *log.Entry
}

func NewMusiclibFS(fuseStore *store.FuseStore, logger *log.Entry) *MusiclibFS {
	return &MusiclibFS{
		pathfs.NewDefaultFileSystem(),
		fuseStore,
		logger,
	}
}

func (s *MusiclibFS) GetAttr(name string, ctx *fuse.Context) (*fuse.Attr, fuse.Status) {
	logEntry := s.logger.WithField("name", name)

	fsItem, err := s.store.GetItem(context.TODO(), name)

	logEntry.
        WithField("fsItem", fsItem).
        WithField("err", err).
        Debug("GetAttr")

	if err != nil {
		if err == store.NotFound {
			return nil, fuse.ENOENT
		}
		return nil, fuse.EIO
	}

	attr := &fuse.Attr{
		Mode: fsItem.Mode(),
		Size: fsItem.Size(),
	}
	attr.SetTimes(fsItem.ATime(), fsItem.MTime(), fsItem.CTime())

	return attr, fuse.OK
}

func (s *MusiclibFS) OpenDir(name string, ctx *fuse.Context) (c []fuse.DirEntry, code fuse.Status) {
	logEntry := s.logger.WithField("name", name)

	dirItems, err := s.store.GetDir(context.TODO(), name)
	if err != nil {
		logEntry.WithError(err).Error("list dir error")
		return nil, fuse.EIO
	}

	c = []fuse.DirEntry{}
	for _, item := range dirItems {
		c = append(c, fuse.DirEntry{Name: item.Name(), Mode: item.Mode()})
	}

	logEntry = logEntry.WithField("items", dirItems)
	logEntry = logEntry.WithField("dirEntries", c)
	logEntry.Debug("OpenDir")
	return c, fuse.OK
}

func (s *MusiclibFS) Open(name string, flags uint32, ctx *fuse.Context) (nodefs.File, fuse.Status) {
	logEntry := s.logger.WithField("name", name)
	logEntry.Debug("OpenFile")

	file, err := s.store.GetFile(context.TODO(), name)
	if err != nil {
		return nil, fuse.ENOENT
	}

	return newFuseFile(file, logEntry), fuse.OK
}

func Mount(rdb *redis.Client, logger *log.Entry, mountPoint string) {
	logger.Level = log.DebugLevel
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
