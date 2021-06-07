FROM node:16.3.0-alpine3.11

# Install screen & bash
RUN apk add --no-cache screen bash

# Defaults
USER root:root
WORKDIR /root

CMD ["/usr/bin/bash"]
