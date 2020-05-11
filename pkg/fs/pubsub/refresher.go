package pubsub

import (
	"encoding/json"
	"log"

	"github.com/go-redis/redis/v7"
	"github.com/rapthead/musiclib/pkg/fs/sync"
)

const doRefreshRecieveChannel = "fuse-refresh"

type Refresh struct {
	rdb *redis.Client
}

func NewRefresh(rdb *redis.Client) Refresh {
	return Refresh{rdb}
}

func (r Refresh) Pub(entities []sync.FuseEntity) {
	jsonEntities, err := json.Marshal(entities)
	if err != nil {
		log.Fatal("Can't json Encode FuseEntities:", err)
	}

	err = r.rdb.Publish(doRefreshRecieveChannel, jsonEntities).Err()
	if err != nil {
		log.Fatal("Can't publish to redis:", err)
	}
}

func (r Refresh) Sub() <-chan []sync.FuseEntity {
	ch := make(chan []sync.FuseEntity)

	rdb := r.rdb
	rdbCh := rdb.Subscribe(doRefreshRecieveChannel).Channel()

	go func() {
		for msg := range rdbCh {
			var entities []sync.FuseEntity
			json.Unmarshal([]byte(msg.Payload), &entities)
			ch <- entities
		}
	}()

	return ch
}
