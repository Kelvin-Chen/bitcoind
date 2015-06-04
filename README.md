# Bitcoind Docker Image
This is a docker image for bitcoind so that you can easily run a full node.

## Running
Start the data only container:
```bash
docker run --name bitcoind_data -v /home/bitcoin/.bitcoin kelvinchen/bitcoind:latest true
```

Start bitcoind:
```bash
docker run --restart always -dp 8333:8333 --volumes-from bitcoind_data kelvinchen/bitcoind:latest
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
