#!/usr/bin/env bash

usage() {
    echo "./run.sh [-e env_file]" >&2
    echo "  -e The file containing the env vars." >&2
    exit 1
}

ARGS=

while getopts ":e:" opt; do
    case $opt in
        e) ARGS="$ARGS --env-file=$OPTARG" ;;
        \?) usage ;;
        :) echo "Option -$OPTARG requires an argument." >&2 ; usage ;;
    esac
done

docker run -d \
    --name bitcoind \
    --restart always \
    -p 8332:8332 \
    -p 8333:8333 \
    -v blockchain:/root/.bitcoin \
    $ARGS \
    kelvinchen/bitcoind:latest
