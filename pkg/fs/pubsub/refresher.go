package pubsub

import (
	"encoding/json"
	"log"

	"github.com/go-redis/redis/v7"
)

const doRefreshRecieveChannel = "fuse-refresh"

type FuseEntity struct {
	OriginPath     string      `json:"originPath"`
	FusePath       string      `json:"fusePath"`
	VorbisComments [][2]string `json:"vorbisComments"`
}

type Refresh struct {
	rdb *redis.Client
}

func NewRefresh(rdb *redis.Client) Refresh {
	return Refresh{rdb}
}

func (r Refresh) Pub(entities []FuseEntity) {
	jsonEntities, err := json.Marshal(entities)
	if err != nil {
		log.Fatal("Can't json Encode FuseEntities:", err)
	}

	err = r.rdb.Publish(doRefreshRecieveChannel, jsonEntities).Err()
	if err != nil {
		log.Fatal("Can't publish to redis:", err)
	}
}

func (r Refresh) Sub() <-chan []FuseEntity {
	ch := make(chan []FuseEntity)

	rdb := r.rdb
	rdbCh := rdb.Subscribe(doRefreshRecieveChannel).Channel()

	go func() {
		for msg := range rdbCh {
			var entities []FuseEntity
			json.Unmarshal([]byte(msg.Payload), &entities)
			ch <- entities
		}
	}()

	return ch
}
