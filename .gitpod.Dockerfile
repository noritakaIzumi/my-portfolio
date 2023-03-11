FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && \
#     sudo apt-get install -yq bastet && \
#     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN sudo apt update && \
    sudo rm -rf /var/lib/apt/lists/*

# Install Hugo
ARG HUGO_VERSION=0.111.2
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-amd64.deb && \
    sudo dpkg -i hugo_${HUGO_VERSION}_linux-amd64.deb && \
    rm hugo_${HUGO_VERSION}_linux-amd64.deb

# Clone the posts repository
RUN git clone https://gitlab.com/noritakaIzumi/my-portfolio-posts.git content
