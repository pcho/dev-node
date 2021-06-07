FROM node:latest

# Install deps
RUN set -xe && \
    apt-get update \
    && apt-get install -y \
    screen \
    zsh

# Change default shell to ZSH
RUN chsh -s /usr/bin/zsh

# Defaults
USER root:root
WORKDIR /root

# Run with ZSH
CMD ["/usr/bin/zsh"]
