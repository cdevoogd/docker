CADDY_VERSION = 2.7.4
CLOUDFLARE_DNS_PROVIDER_VERSION = 74f004e1c1ab9056288f0baf3cd4b0039d6c77f3

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
