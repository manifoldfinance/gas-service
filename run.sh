#!/bin/sh
docker container run -p 1234:80 manifoldfinance/deepgwei -e ETHEREUM_URL=https://mainnet.infura.io/v3/ed483295c05b4730938cafe48441773c

