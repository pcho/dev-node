FROM node:16.3.0-alpine3.13

# Install screen & bash
RUN apk add --no-cache screen \
    bash

RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

# Defaults
USER root:root
WORKDIR /root

CMD ["/bin/bash"]
