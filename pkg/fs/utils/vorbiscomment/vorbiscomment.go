package vorbiscomment

import (
	"bytes"
	"encoding/binary"
	"fmt"

	"github.com/icza/bitio"
	"github.com/mewkiz/flac/meta"
	"github.com/mewkiz/pkg/errutil"
)

type MyVorbisComment meta.VorbisComment

func (s *MyVorbisComment) Encode(isLast bool) ([]byte, error) {
	buf := new(bytes.Buffer)
	bw := bitio.NewWriter(buf)
	err := encodeVorbisComment(bw, (*meta.VorbisComment)(s), isLast)
	return buf.Bytes(), err
}

// --- [ Metadata block header ] -----------------------------------------------

// encodeBlockHeader encodes the metadata block header, writing to bw.
func encodeBlockHeader(bw *bitio.Writer, hdr *meta.Header) error {
	// 1 bit: IsLast.
	if err := bw.WriteBool(hdr.IsLast); err != nil {
		return errutil.Err(err)
	}
	// 7 bits: Type.
	if err := bw.WriteBits(uint64(hdr.Type), 7); err != nil {
		return errutil.Err(err)
	}
	// 24 bits: Length.
	if err := bw.WriteBits(uint64(hdr.Length), 24); err != nil {
		return errutil.Err(err)
	}
	return nil
}

// --- [ VorbisComment ] -------------------------------------------------------

// encodeVorbisComment encodes the VorbisComment metadata block, writing to bw.
func encodeVorbisComment(bw *bitio.Writer, comment *meta.VorbisComment, last bool) error {
	// Store metadata block header.
	nbits := int64(32 + 8*len(comment.Vendor) + 32)
	for _, tag := range comment.Tags {
		nbits += int64(32 + 8*(len(tag[0])+1+len(tag[1])))
	}
	hdr := &meta.Header{
		IsLast: last,
		Type:   meta.TypeVorbisComment,
		Length: nbits / 8,
	}
	if err := encodeBlockHeader(bw, hdr); err != nil {
		return errutil.Err(err)
	}

	// Store metadata block body.
	// 32 bits: vendor length.
	// TODO: verify that little-endian encoding is used; otherwise, switch to
	// using bw.WriteBits.
	if err := binary.Write(bw, binary.LittleEndian, uint32(len(comment.Vendor))); err != nil {
		return errutil.Err(err)
	}
	// (vendor length) bits: Vendor.
	if _, err := bw.Write([]byte(comment.Vendor)); err != nil {
		return errutil.Err(err)
	}
	// Store tags.
	// 32 bits: number of tags.
	if err := binary.Write(bw, binary.LittleEndian, uint32(len(comment.Tags))); err != nil {
		return errutil.Err(err)
	}
	for _, tag := range comment.Tags {
		// Store tag, which has the following format:
		//    NAME=VALUE
		buf := []byte(fmt.Sprintf("%s=%s", tag[0], tag[1]))
		// 32 bits: vector length
		if err := binary.Write(bw, binary.LittleEndian, uint32(len(buf))); err != nil {
			return errutil.Err(err)
		}
		// (vector length): vector.
		if _, err := bw.Write(buf); err != nil {
			return errutil.Err(err)
		}
	}
	return nil
}
