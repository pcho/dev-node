FROM node:latest

# Install GNU Screen
RUN set -xe && \
        apt-get update \
        && apt-get install -y \
        screen

# Defaults
USER root:root
WORKDIR /root
