# Bitcoind Docker Image
This is a docker image for bitcoind so that you can easily run a full node.

## Running
```bash
$ docker run --restart always -dp 8333:8333 -v blockchain:/home/bitcoin/.bitcoin kelvinchen/bitcoind:latest
```

### Using docker-compose
Pre-built images:
```bash
$ docker-compose pull
$ docker-compose up -d
```

Build the images yourself:
```bash
$ docker-compose -f build.yml build
$ docker-compose -f build.yml up -d
```

## Setup

### Ports
- JSON-RPC: 8332
- bitcoind: 8333

### Data Directory
The data directory for the blockchain and other bitcoind related files is
located at `/home/bitcoin/.bitcoin`. Make a volume to keep the blockchain
persistent.

### JSON-RPC Authentication
This docker image automatically generates a password for the JSON-RPC
interface. You can use your own password by overwriting the `BITCOIND_PASSWORD`
environment variable. The username is `btcrpc`.
