#!/bin/bash -x

docker pull mongo:latest
docker build -t aaasm/post:1.0 ./post-py
docker build -t aaasm/comment:1.0 ./comment
docker build -t aaasm/ui:1.0 ./ui
