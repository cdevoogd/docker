FROM alpine:3.19
ARG RSNAPSHOT_VERSION
RUN apk add --no-cache rsnapshot=~${RSNAPSHOT_VERSION} rsync openssh-client
COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
