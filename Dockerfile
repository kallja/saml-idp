FROM node:18-alpine3.17

RUN \
  apk update && \
  apk add openssl

COPY . /application
WORKDIR /application

RUN \
  yarn

ENTRYPOINT [ "/application/scripts/entrypoint.sh" ]
