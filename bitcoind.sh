#!/usr/bin/env bash

cd ${0%/*}

randpass=$(head -c 4096 /dev/urandom | sha256sum | awk '{print $1}')
${BITCOIND_PASSWORD:=$randpass}

cp -n /bitcoin.conf ~/.bitcoin/bitcoin.conf

sed -i "s/rpcpassword=.*/rpcpassword=$BITCOIND_PASSWORD/g" \
  ~/.bitcoin/bitcoin.conf

bitcoind
