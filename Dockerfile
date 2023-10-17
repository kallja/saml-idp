FROM node:18-alpine3.17 AS builder

RUN \
  apk update && \
  apk add openssl git &&\
  yarn global add pnpm

COPY . /application
WORKDIR /application

RUN \
  pnpm install


FROM builder

EXPOSE 7000

COPY --from=builder /application /application

WORKDIR /application

ENTRYPOINT [ "/application/scripts/entrypoint.sh" ]
