BUILD_IMAGE = jekyll/jekyll:3.8

SERVE_PORT = 6161

ROOT = $(shell git rev-parse --show-toplevel)
SRC = $(ROOT)/src
DST = $(ROOT)/_site

build:
	docker run --rm --tty \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		--env JEKYLL_UID=0 \
		$(BUILD_IMAGE) jekyll build

serve:
	docker run \
		--publish $(SERVE_PORT):$(SERVE_PORT) \
		--volume $(ROOT):/$(ROOT) \
		--workdir $(ROOT) \
		--tty --rm $(BUILD_IMAGE) \
		jekyll serve --port $(SERVE_PORT) --watch

Gemfile.lock: Gemfile
	docker run \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		--tty --rm ruby:2.6-alpine \
		bundle lock --update
