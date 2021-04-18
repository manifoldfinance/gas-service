FROM node:14.16.1-alpine3.12 AS builder

WORKDIR /app
RUN apk --no-cache add curl

ENV NODE_ENV='production'

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install

COPY . /app/
RUN npx tsc

FROM node:14.16.1-alpine3.12

COPY --from=builder /app /app

EXPOSE 80
ENV ETHEREUM_URL https://mainnet.infura.io/v3/ed483295c05b4730938cafe48441773c
ENV POLLING_FREQUENCY_SECONDS 5

ENTRYPOINT [ "node", "output/WebServer.js" ]
