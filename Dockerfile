FROM node:latest

# Install screen
RUN set -xe && \
        apt-get update \
        && apt-get install -y \
        screen

# Defaults
USER root:root
WORKDIR /root

CMD ["/bin/bash"]
