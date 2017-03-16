# Bitcoind Docker Image
This is a docker image for bitcoind so that you can easily run a full node.

## Running
Pull the image:

    docker pull kelvinchen/bitcoind:latest

Create a volume to store the config file and the blockchain. This step is
optional if you want to mount the volume to a local directory instead of
using named Docker volumes.

    docker volume create bitcoin

Finally, start the container

    docker run -d --name bitcoind --restart always -p 8333:8333 -v bitcoin:/usr/local/bitcoin kelvinchen/bitcoind:latest

## Configuration
The `bitcoin.conf` config file is stored in the volume you used when running
the container.
