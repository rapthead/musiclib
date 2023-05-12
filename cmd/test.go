package main

import (
	"bytes"
	"errors"
	"fmt"
	"io"
	"log"
	"os"

	"github.com/mewkiz/flac/meta"
	"github.com/rapthead/musiclib/pkg/fs/models"
	"github.com/rapthead/musiclib/pkg/fs/utils"
)

func main() {
	path := os.Args[1]
	vorbisCommentPos, err := utils.GetVorbisCommentPos(path)
	if err != nil {
		log.Fatal(err)
	}
	vorbisBlock, err := utils.EncodeVorbisComment("musiclib", [][2]string{
		{"TITLE", "mittle"},
	}, vorbisCommentPos.IsLast)
	if err != nil {
		log.Fatal(err)
	}
	ff, err := models.NewFlacFile(models.FlacData{
		OriginPath:       path,
		ReplacementStart: vorbisCommentPos.Start,
		ReplacementEnd:   vorbisCommentPos.End,
		MetaBlock:        vorbisBlock,
	})
	if err != nil {
		log.Fatal(err)
	}

	buf := make([]byte, 128)
	b := bytes.NewBuffer(nil)
	var off int64
	for {
		n, err := ff.ReadAt(buf, off)
		if n > 0 {
			off += int64(n)
			b.Write(buf[:n])
		}
		if err != nil {
			if errors.Is(err, io.EOF) || errors.Is(err, io.ErrUnexpectedEOF) {
				break
			}
			log.Fatal(err)
		}
	}

	b.Next(4)

	for {
		block, err := meta.New(b)
		if err != nil {
			log.Fatal(err)
		}
		block.Skip()
		fmt.Printf("type=%s length=%d isLast=%t\n", block.Type, block.Length, block.IsLast)
		if block.IsLast {
			return
		}
	}
}
