#!/usr/bin/env bash

cd ${0%/*}

docker build --pull -t kelvinchen/bitcoind:latest .
