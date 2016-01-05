#!/usr/bin/env bash

docker run -d \
    --name bitcoind \
    --restart always \
    -p 8332:8332 \
    -p 8333:8333 \
    -v blockchain:/root/.bitcoin \
    kelvinchen/bitcoind:latest
