package utils

import (
	"bytes"
	"errors"
	"fmt"
	"io"
	"os"

	"github.com/mewkiz/flac/meta"
	"github.com/rapthead/musiclib/pkg/fs/utils/vorbiscomment"
)

var flacSignature = []byte("fLaC")

func GetVorbisCommentPos(path string) (int64, int64, error) {
	file, err := os.Open(path)
	if err != nil {
		return 0, 0, err
	}
	defer file.Close()

	var buf [4]byte
	if _, err = io.ReadFull(file, buf[:]); err != nil {
		return 0, 0, err
	}

	if !bytes.Equal(buf[:], flacSignature) {
		return 0, 0, fmt.Errorf("flac.parseStreamInfo: invalid FLAC signature; expected %q, got %q", flacSignature, buf)
	}

	var siBlockStart int64
	isLast := false
	for !isLast {
		currentBlockStart, err := file.Seek(0, io.SeekCurrent)
		if err != nil {
			return 0, 0, err
		}
		block, err := meta.New(file)
		if err != nil && err != meta.ErrReservedType {
			return 0, 0, err
		}
		if err = block.Skip(); err != nil {
			return 0, 0, err
		}
		isLast = block.IsLast
		currentBlockEnd, err := file.Seek(0, io.SeekCurrent)
		if err != nil {
			return 0, 0, err
		}

		if block.Header.Type == meta.TypeStreamInfo {
			siBlockStart = currentBlockStart
		}
		if block.Header.Type == meta.TypeVorbisComment {
			return currentBlockStart, currentBlockEnd, nil
		}
	}

	if siBlockStart == 0 {
		return 0, 0, errors.New("place for VorbisComment not found")
	}
	return siBlockStart, siBlockStart, nil
}

func EncodeVorbisComment(vendor string, tags [][2]string) ([]byte, error) {
	vc := vorbiscomment.MyVorbisComment{
		Vendor: vendor,
		Tags:   tags,
	}
	metaBlock, err := vc.Encode()
	if err != nil {
		return nil, fmt.Errorf("tags encoding error: %v", err)
	} else {
		return metaBlock, nil
	}
}
