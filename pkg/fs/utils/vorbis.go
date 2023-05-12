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

type VorbisCommentPos struct {
	Start  int64
	End    int64
	IsLast bool
}

func GetVorbisCommentPos(path string) (VorbisCommentPos, error) {
	info := VorbisCommentPos{}
	file, err := os.Open(path)
	if err != nil {
		return info, err
	}
	defer file.Close()

	var buf [4]byte
	if _, err = io.ReadFull(file, buf[:]); err != nil {
		return info, err
	}

	if !bytes.Equal(buf[:], flacSignature) {
		return info, fmt.Errorf("flac.parseStreamInfo: invalid FLAC signature; expected %q, got %q", flacSignature, buf)
	}

	isLast := false
	for !isLast {
		currentBlockStart, err := file.Seek(0, io.SeekCurrent)
		if err != nil {
			return info, err
		}
		block, err := meta.New(file)
		if err != nil && err != meta.ErrReservedType {
			return info, err
		}
		if err = block.Skip(); err != nil {
			return info, err
		}
		isLast = block.IsLast
		currentBlockEnd, err := file.Seek(0, io.SeekCurrent)
		if err != nil {
			return info, err
		}

		if block.Type == meta.TypeStreamInfo {
			// сломается, если в мете только 1 блок stream info
			if block.IsLast {
				return info, errors.New("meta with only one block is not supported")
			}
			info = VorbisCommentPos{
				Start:  currentBlockStart,
				End:    currentBlockStart,
				IsLast: false,
			}
		}
		if block.Type == meta.TypeVorbisComment {
			info = VorbisCommentPos{
				Start:  currentBlockStart,
				End:    currentBlockEnd,
				IsLast: block.IsLast,
			}
			return info, nil
		}
	}

	if info.Start == 0 {
		return info, errors.New("place for VorbisComment not found")
	}
	return info, nil
}

func EncodeVorbisComment(vendor string, tags [][2]string, isLast bool) ([]byte, error) {
	vc := vorbiscomment.MyVorbisComment{
		Vendor: vendor,
		Tags:   tags,
	}
	metaBlock, err := vc.Encode(isLast)
	if err != nil {
		return nil, fmt.Errorf("tags encoding error: %v", err)
	} else {
		return metaBlock, nil
	}
}
