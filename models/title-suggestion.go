package models

import (
	"strings"
)

var SPECIAL_WORDS = []string{
	"a",
	"an",
	"and",
	"as",
	"at",
	"but",
	"by",
	"for",
	"from",
	"in",
	"nor",
	"of",
	"on",
	"or",
	"so",
	"the",
	"to",
	"yet",
}

func TitleSuggestion(title string) string {
	words := strings.Split(title, " ")
	hasChanges := false
	for i := range words {
		if i == 0 || i == len(words)-1 {
			continue
		}
		for _, specWord := range SPECIAL_WORDS {
			if strings.ToLower(words[i]) == specWord &&
				strings.ToLower(words[i]) != words[i] {
				words[i] = specWord
				hasChanges = true
			}
		}
	}
	if hasChanges {
		return strings.Join(words, " ")
	}
	return ""
}
