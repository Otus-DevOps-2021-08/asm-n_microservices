
include ../../Makefile.inc

REPOSITORY = aaasm
NAME = ui
VERSION = 1.0
DOCKERFILE = Dockerfile.2

.PHONY: pre-build

pre-build:
	echo `git show --format="%h" HEAD | head -1` > build_info.txt
	echo `git rev-parse --abbrev-ref HEAD` >> build_info.txt

build: pre-build
