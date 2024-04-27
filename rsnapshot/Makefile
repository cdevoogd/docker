RSNAPSHOT_VERSION = 1.4.5

IMAGE_NAME = cdevoogd/rsnapshot
VERSION_TAG = ${IMAGE_NAME}:${RSNAPSHOT_VERSION}
LATEST_TAG = ${IMAGE_NAME}:latest

.PHONY: image
image:
	docker build \
		--rm \
		--file Dockerfile \
		--tag "${VERSION_TAG}" \
		--tag "${LATEST_TAG}" \
		--build-arg RSNAPSHOT_VERSION="${RSNAPSHOT_VERSION}" \
		.

.PHONY: push
push:
	docker push "${VERSION_TAG}"
	docker push "${LATEST_TAG}"
