FROM golang:latest AS go

FROM debian:bookworm-slim

ARG HUGO_VERSION=0.165.0

COPY --from=go /usr/local/go /usr/local/go
ENV PATH="/usr/local/go/bin:${PATH}"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
        ca-certificates \
        git \
        nodejs \
        npm \
    && wget -O /tmp/hugo.tar.gz \
        "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" \
    && tar -xzf /tmp/hugo.tar.gz -C /usr/local/bin hugo \
    && rm -f /tmp/hugo.tar.gz \
    && apt-get purge -y --auto-remove wget \
    && rm -rf /var/lib/apt/lists/* \
    && go version \
    && hugo version \
    && node --version \
    && npm --version

WORKDIR /src

ENTRYPOINT ["hugo"]
