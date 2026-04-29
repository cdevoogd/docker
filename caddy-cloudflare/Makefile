CADDY_VERSION = 2.11.2
CLOUDFLARE_DNS_PROVIDER_VERSION = a8737d095ad5a48ca031cea6ab704057dbc2d250

IMAGE_NAME = cdevoogd/caddy-cloudflare
VERSION_TAG = ${IMAGE_NAME}:${CADDY_VERSION}
LATEST_TAG = ${IMAGE_NAME}:latest

.PHONY: image
image:
	docker build \
		--rm \
		--file Dockerfile \
		--tag "${VERSION_TAG}" \
		--tag "${LATEST_TAG}" \
		--build-arg CADDY_VERSION="${CADDY_VERSION}" \
		--build-arg CLOUDFLARE_DNS_PROVIDER_VERSION=${CLOUDFLARE_DNS_PROVIDER_VERSION} \
		.

.PHONY: push
push:
	docker push "${VERSION_TAG}"
	docker push "${LATEST_TAG}"
