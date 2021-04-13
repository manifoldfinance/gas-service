FROM node:14-alpine

WORKDIR /app

ENV NODE_ENV=production

RUN apk add --update --no-cache curl

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install

COPY . /app/
RUN npx tsc

EXPOSE 80
ENV ETHEREUM_URL https://mainnet.infura.io/v3/ed483295c05b4730938cafe48441773c
ENV POLLING_FREQUENCY_SECONDS 5
HEALTHCHECK --interval=12s --timeout=12s --start-period=30s \
    CMD node healthcheck.js

ENTRYPOINT [ "node", "output/WebServer.js" ]
