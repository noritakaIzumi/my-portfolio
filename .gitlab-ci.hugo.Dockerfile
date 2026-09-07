FROM hugomods/hugo:exts:0.165.0

RUN apk update \
  && apk --no-cache add git go nodejs npm
