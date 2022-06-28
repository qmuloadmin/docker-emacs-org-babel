NAME=emacs-org-babel
TAG=latest
REGISTRY=keozon
IMAGE=$(REGISTRY)/$(NAME):$(TAG)
DOCKER_CMD=docker

all:
	$(DOCKER_CMD) build -t $(IMAGE) .
	$(DOCKER_CMD) push $(IMAGE)

clean:
	- $(DOCKER_CMD) rmi $(IMAGE)

.PHONY: all clean
