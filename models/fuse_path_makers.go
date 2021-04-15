package models

import (
	"fmt"
	"strings"
	"unicode"
)

func RecentPlaylistFusePath(e Metadata) string {
	return joinParts(
		"recent",
		fmt.Sprintf(
			"%s–%s–%s–%s%s.m3u",
			e.EnabledAt.Format("2006-01-02"),
			e.AlbumArtist,
			e.Date("_"),
			e.AlbumTitle,
			e.AlbumSuffix(),
		),
	)
}

func GroupedPlaylistFusePath(e Metadata) string {
	firstArtistChar := unicode.ToLower([]rune(e.SortAlbumArtist())[0])
	if (firstArtistChar >= '\u0430' && firstArtistChar <= '\u044F') || // is russian
		(firstArtistChar >= '\u0061' && firstArtistChar <= '\u007A') { // is latin
	} else {
		firstArtistChar = '#'
	}

	return joinParts(
		"grouped",
		string(firstArtistChar),
		e.AlbumArtist,
		fmt.Sprintf(
			"%s-%s.m3u",
			e.Date("-"),
			e.AlbumTitle,
		),
	)
}

func FlacFusePath(e Metadata) string {
	pathParts := albumPathParts(
		e.SortAlbumArtist(),
		e.AlbumArtist,
		e.Date("_"),
		e.AlbumTitle,
		e.AlbumSuffix(),
	)

	pathSuffix := fmt.Sprintf(
		"%02d-%s.flac",
		e.TrackNumber,
		e.TrackTitle,
	)
	if e.DiscTotal != 1 {
		pathParts = append(pathParts, fmt.Sprintf(
			"%d.%s",
			e.DiscNumber,
			pathSuffix,
		))
	} else {
		pathParts = append(pathParts, pathSuffix)
	}

	return joinParts(pathParts...)
}

func CoverFusePath(meta FuseCover) string {
	return joinParts(
		append(
			albumPathParts(
				meta.SortAlbumArtist(),
				meta.AlbumArtist,
				meta.Date("_"),
				meta.AlbumTitle,
				meta.AlbumSuffix(),
			),
			"cover.jpeg",
		)...,
	)
}

func joinParts(pathParts ...string) string {
	fusePath := ""
	for _, pathPart := range pathParts {
		fusePath = fusePath + "/" + strings.TrimRight(pathReplacer.Replace(pathPart), ".")
	}
	fusePath = strings.TrimPrefix(fusePath, "/")
	return fusePath
}

var pathReplacer = strings.NewReplacer(
	"<", "_",
	">", "_",
	":", "_",
	"\"", "_",
	"/", "_",
	"\\", "_",
	"|", "_",
	"?", "_",
	"*", "_",
	",", "_",
)

func albumPathParts(
	sortAlbumArtist string,
	albumArtist string,
	dashDate string,
	albumTitle string,
	albumSuffix string,
) []string {
	pathParts := []string{
		"albums",
		fmt.Sprintf(
			"%s–%s–%s%s",
			albumArtist,
			dashDate,
			albumTitle,
			albumSuffix,
		),
	}
	return pathParts
}
