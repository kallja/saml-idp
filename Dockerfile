FROM node:18-alpine3.17

EXPOSE 7000

RUN \
  apk update && \
  apk add openssl &&\
  yarn global add pnpm

COPY . /application
WORKDIR /application

RUN \
  pnpm install

ENTRYPOINT [ "/application/scripts/entrypoint.sh" ]
