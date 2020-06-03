package coverstorage

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"path"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
)

const sniffLen = 512

type FSCoverStorage struct {
	StoragePath string
}

func (s FSCoverStorage) Save(id uuid.UUID, mime models.ImageTypeEnum, reader io.Reader) error {
	path := s.makePath(id)

	file, err := os.Create(path)
	if err != nil {
		return fmt.Errorf("can't open cover file for write: %w", err)
	}
	defer func() {
		if err := file.Close(); err != nil {
			panic(err)
		}
	}()

	_, err = io.Copy(file, reader)
	if err != nil {
		return fmt.Errorf("can't stream cover to file: %w", err)
	}
	return nil
}

func (s FSCoverStorage) Get(id uuid.UUID) (string, io.ReadCloser, error) {
	path := s.makePath(id)
	file, err := os.OpenFile(path, os.O_RDONLY, 0600)
	if err != nil {
		return "", nil, fmt.Errorf("can't open cover file: %w", err)
	}

	var buf [sniffLen]byte
	n, err := io.ReadFull(file, buf[:])
	ctype := http.DetectContentType(buf[:n])
	_, err = file.Seek(0, io.SeekStart)
	if err != nil {
		return "", nil, fmt.Errorf("can't seek cover file: %w", err)
	}

	return ctype, file, nil
}

func (s FSCoverStorage) Delete(id uuid.UUID) error {
	return os.Remove(s.makePath(id))
}

func (s FSCoverStorage) makePath(id uuid.UUID) string {
	return path.Join(s.StoragePath, id.String())
}
