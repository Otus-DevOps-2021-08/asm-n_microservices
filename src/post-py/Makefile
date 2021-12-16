
include ../../Makefile.inc

REPOSITORY = aaasm
NAME = post
VERSION = logging
DOCKERFILE = Dockerfile

.PHONY: pre-build

pre-build:
	echo `git show --format="%h" HEAD | head -1` > build_info.txt
	echo `git rev-parse --abbrev-ref HEAD` >> build_info.txt

build: pre-build
