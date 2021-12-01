#!/bin/bash -x

USER_NAME=aaasm

for i in ui post-py comment; do
  cd src/$i
  USER_NAME=${USER_NAME} bash docker_build.sh
  cd -
done
