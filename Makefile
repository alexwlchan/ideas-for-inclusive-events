BUILD_IMAGE = alexwlchan/alexwlchan.net/inclusive-events

SERVE_CONTAINER = server
SERVE_PORT      = 6161

RSYNC_HOST = 139.162.244.147
RSYNC_USER = alexwlchan
RSYNC_DIR = /home/alexwlchan/sites/alexwlchan.net/inclusive-events/

ROOT = $(shell git rev-parse --show-toplevel)
SRC = $(ROOT)/src
DST = $(ROOT)/_site

$(ROOT)/.docker/build: Dockerfile Gemfile.lock
	docker build --tag $(BUILD_IMAGE) .
	mkdir -p .docker
	touch .docker/build

.docker/build: $(ROOT)/.docker/build

build: .docker/build
	docker run --volume $(ROOT):/$(ROOT) --workdir $(ROOT) $(BUILD_IMAGE) build

stop:
	@# Clean up old running containers
	@docker stop $(SERVE_CONTAINER) >/dev/null 2>&1 || true
	@docker rm $(SERVE_CONTAINER) >/dev/null 2>&1 || true

serve: .docker/build stop
	docker run \
		--publish $(SERVE_PORT):$(SERVE_PORT) \
		--volume $(ROOT):/$(ROOT) \
		--workdir $(ROOT) \
		--name $(SERVE_CONTAINER) \
		--hostname $(SERVE_CONTAINER) \
		--tty --rm --detach $(BUILD_IMAGE) \
		serve --host $(SERVE_CONTAINER) --port $(SERVE_PORT) --watch --drafts --incremental

serve-debug: serve
	docker attach $(SERVE_CONTAINER)

rsync:
	docker run --rm --tty \
		--volume ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		--volume $(DST):/data \
		instrumentisto/rsync-ssh \
		rsync \
		--archive \
		--verbose \
		--compress \
		--delete \
		--exclude=".well-known" \
		--exclude=".DS_Store" \
		--exclude="attic/" \
		--rsh="ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa" \
		/data/ "$(RSYNC_USER)"@"$(RSYNC_HOST)":"$(RSYNC_DIR)"

deploy: publish rsync

Gemfile.lock: Gemfile
	docker run \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		--tty --rm $(shell cat Dockerfile | grep FROM | awk '{print $$2}') \
		bundle lock --update
