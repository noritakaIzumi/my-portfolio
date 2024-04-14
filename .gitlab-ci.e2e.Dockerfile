FROM debian:bookworm-slim

RUN apt update && apt install -y curl

SHELL ["/bin/bash", "-lc"]

RUN curl https://get.volta.sh | bash && . ${HOME}/.profile

COPY package.json npm-shrinkwrap.json ./
RUN npm install -g http-server && npm ci && npx playwright install --with-deps

RUN apt clean -y && apt autoremove -y
