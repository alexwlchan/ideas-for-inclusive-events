BUILD_IMAGE = jekyll/jekyll:3.8

SERVE_PORT = 6161

RSYNC_HOST = 139.162.244.147
RSYNC_USER = alexwlchan
RSYNC_DIR = /home/alexwlchan/sites/alexwlchan.net/ideas-for-inclusive-events/

ROOT = $(shell git rev-parse --show-toplevel)
SRC = $(ROOT)/src
DST = $(ROOT)/_site

build:
	docker run --volume $(ROOT):/$(ROOT) --workdir $(ROOT) $(BUILD_IMAGE) jekyll build

serve:
	docker run \
		--publish $(SERVE_PORT):$(SERVE_PORT) \
		--volume $(ROOT):/$(ROOT) \
		--workdir $(ROOT) \
		--tty --rm $(BUILD_IMAGE) \
		jekyll serve --port $(SERVE_PORT) --watch

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
		--rsh="ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa" \
		/data/ "$(RSYNC_USER)"@"$(RSYNC_HOST)":"$(RSYNC_DIR)"

deploy: build rsync
