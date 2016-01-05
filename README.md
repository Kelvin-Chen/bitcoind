# Bitcoind Docker Image
This is a docker image for bitcoind so that you can easily run a full node.

## Running
To start a bitcoind node run the command:
```bash
./run.sh
```

### Building the Image Yourself
If you want to build the image, simply run
```bash
./build.sh
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
