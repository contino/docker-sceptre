SCEPTRE_VERSION = 2.2.1
IMAGE_NAME ?= contino/sceptre:$(SCEPTRE_VERSION)
TAG = $(SCEPTRE_VERSION)

build:
	docker build -t $(IMAGE_NAME) .

test:
	docker run --rm -it $(IMAGE_NAME) sceptre --version | grep $(SCEPTRE_VERSION)

shell:
	docker run --rm -it -v ~/.aws:/root/.aws -v $(shell pwd):/opt/app $(IMAGE_NAME) bash

gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
