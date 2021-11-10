#!/bin/bash -x

docker pull mongo:latest
docker build -t aaasm/post:1.0 ./post-py
docker build -t aaasm/comment:2.0 -f ./comment/Dockerfile.2 ./comment
docker build -t aaasm/ui:2.0 -f ./ui/Dockerfile.2 ./ui
