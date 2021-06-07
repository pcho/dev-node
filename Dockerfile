FROM node:16.3.0-alpine3.11

# Install screen
RUN apk add --no-cache screen

# Defaults
USER root:root
WORKDIR /root

CMD ["node"]
