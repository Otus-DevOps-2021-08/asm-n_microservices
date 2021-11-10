#!/bin/bash -x

docker network create reddit
docker run -d --name=mongo --network=reddit \
    --network-alias=post_db_1 \
    --network-alias=comment_db_1 \
   mongo:latest
docker run -d --name=post --network=reddit \
    --network-alias=post_1 \
    --env POST_DATABASE_HOST=post_db_1 \
  aaasm/post:1.0
docker run -d --name=comment --network=reddit \
    --network-alias=comment_1 \
    --env COMMENT_DATABASE_HOST=comment_db_1 \
  aaasm/comment:1.0
docker run -d --name=ui --network=reddit \
    -p 9292:9292 \
    --env POST_SERVICE_HOST=post_1 \
    --env COMMENT_SERVICE_HOST=comment_1 \
  aaasm/ui:1.0
