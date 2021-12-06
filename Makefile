
export REPOSITORY = aaasm

SUBDIRS = src/comment \
					src/post-py \
					src/ui \
					monitoring/blackbox-exporter \
					monitoring/prometheus

.PHONY: all build push clean $(SUBDIRS)

all: build push

build: $(SUBDIRS)

push: $(SUBDIRS)

clean: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) --environment-overrides --directory $@ $(MAKECMDGOALS)
