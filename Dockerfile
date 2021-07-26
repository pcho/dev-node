FROM node:latest

ENV DEBIAN_FRONTEND="noninteractive"

# Install deps
RUN set -xe && \
    apt-get update \
    && apt-get install -y \
    apt-utils \
    build-essential \
    libevent-dev \
    ncurses-dev \
    fd-find \
    bison \
    pkg-config \
    cmake \
    tzdata \
    autoconf \
    libtool \
    locales

# Sets Timezone to EU/Berlin
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure tzdata

# Sets locales to en_US.UTF-8
RUN set -xe &&\
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

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

# Defaults
USER root:root
WORKDIR /root

CMD ["/bin/bash"]
