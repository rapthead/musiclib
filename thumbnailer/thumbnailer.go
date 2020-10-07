package thumbnailer

import (
	"fmt"
	"image"
	"image/jpeg"
	_ "image/png"
	"io"

	"github.com/nfnt/resize"
)

type Thumbnailer struct {
}

func (s Thumbnailer) Thumbnail(w io.Writer, r io.Reader, maxWidth, maxHeight uint) error {
	img, _, err := image.Decode(r)
	if err != nil {
		return fmt.Errorf("image decoding error: %w", err)
	}

	thumbnail := resize.Thumbnail(maxWidth, maxHeight, img, resize.Bilinear)
	return jpeg.Encode(w, thumbnail, nil)
}
