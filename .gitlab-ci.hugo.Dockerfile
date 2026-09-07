FROM hugomods/hugo:exts

RUN apk update \
  && apk --no-cache add git go nodejs npm
