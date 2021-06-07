FROM node:latest

# Install deps
RUN set -xe && \
        apt-get update \
        && apt-get install -y \
        apt-utils \
        build-essential \
        libgd-dev \
        libxslt-dev \
        libgeoip-dev \
        libssl-dev \
        ncurses-dev \
        libevent-dev \
        libpcre++-dev \
        zsh \
        cmake \
        bison \
        autoconf \
        libtool

# Install TMUX from source
RUN set -xe \
    && git clone --depth=1 https://github.com/tmux/tmux.git /tmux \
    && ( \
            cd /tmux \
            && sh autogen.sh \
            && ./configure \
            && make \
            && make install \
            && cd .. \
            && rm -rf /tmux \
       )

# Install tmux-mem-cpu-load plugin for tmux
RUN set -xe \
    && git clone --depth=1 https://github.com/thewtex/tmux-mem-cpu-load /tmcl \
    && ( \
            cd /tmcl \
            && cmake . \
            && make \
            && make install \
            && cd .. \
            && rm -rf /tmcl \
       )

# Change default shell to ZSH
RUN chsh -s /usr/bin/zsh

# Defaults
USER root:root
WORKDIR /root

# Run with ZSH
CMD ["/usr/bin/zsh"]
