package thumbnailer

import (
	"fmt"
	"image"
	"image/jpeg"
	"io"

	"github.com/nfnt/resize"
)

const sniffLen = 512

type Thumbnailer struct {
	CachePath string
}

func (s Thumbnailer) Thumbnail(w io.Writer, r io.Reader, maxWidth, maxHeight uint) error {
	img, _, err := image.Decode(r)
	if err != nil {
		return fmt.Errorf("image decoding error: %w", err)
	}

	thumbnail := resize.Thumbnail(maxWidth, maxHeight, img, resize.Bilinear)
	return jpeg.Encode(w, thumbnail, nil)
}
