package pubsub

import (
	"context"
	"encoding/json"
	"log"

	"github.com/go-redis/redis/v8"
	"github.com/rapthead/musiclib/pkg/fs/sync"
)

const doRefreshRecieveChannel = "fuse-refresh"

type Refresh struct {
	rdb *redis.Client
}

func NewRefresh(rdb *redis.Client) Refresh {
	return Refresh{rdb}
}

func (r Refresh) Pub(entities []sync.FuseFlacEntity) {
	jsonEntities, err := json.Marshal(entities)
	if err != nil {
		log.Fatal("Can't json Encode FuseEntities:", err)
	}

	err = r.rdb.Publish(context.TODO(), doRefreshRecieveChannel, jsonEntities).Err()
	if err != nil {
		log.Fatal("Can't publish to redis:", err)
	}
}

func (r Refresh) Sub() <-chan []sync.FuseFlacEntity {
	ch := make(chan []sync.FuseFlacEntity)

	rdb := r.rdb
	rdbCh := rdb.Subscribe(context.TODO(), doRefreshRecieveChannel).Channel()

	go func() {
		for msg := range rdbCh {
			var entities []sync.FuseFlacEntity
			json.Unmarshal([]byte(msg.Payload), &entities)
			ch <- entities
		}
	}()

	return ch
}
