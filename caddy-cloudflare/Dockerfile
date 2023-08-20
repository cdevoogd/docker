ARG CADDY_VERSION
FROM caddy:${CADDY_VERSION}-builder-alpine AS builder
ARG CLOUDFLARE_DNS_PROVIDER_VERSION
RUN xcaddy build --with github.com/caddy-dns/cloudflare@${CLOUDFLARE_DNS_PROVIDER_VERSION}

ARG CADDY_VERSION
FROM caddy:${CADDY_VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
