FROM registry.gitlab.com/pages/hugo/hugo_extended:0.120.3

RUN apk update \
  && apk --no-cache add git go nodejs npm
