
.PHONY: all build push clean

all: build push

build:
	docker build -t $(REPOSITORY)/$(NAME):$(VERSION) -f $(DOCKERFILE) .
	docker tag $(REPOSITORY)/$(NAME):$(VERSION) $(REPOSITORY)/$(NAME):latest

push: build
	docker push $(REPOSITORY)/$(NAME):$(VERSION)
	docker push $(REPOSITORY)/$(NAME):latest

clean:
	docker rmi -f $$(docker images -q $(REPOSITORY)/$(NAME):$(VERSION)) || true
