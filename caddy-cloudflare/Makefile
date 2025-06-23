CADDY_VERSION = 2.10.0
CLOUDFLARE_DNS_PROVIDER_VERSION = 35fb8474f57d7476329f75d63eebafb95a93022f

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
