# Bitcoind Docker Image
This is a docker image for bitcoind so that you can easily run a full node.

## Running
Pull the image:
```bash
$ docker pull kelvinchen/bitcoind:latest
```
Or build it yourself:
```bash
$ ./build.sh
```

Start bitcoind:
```bash
$ ./run.sh

# Or, if you want to set the RPC password yourself
$ ./run.sh -e envfile

# "envfile" is a single file containing the environment
# variable for the password.
# e.g.
# BITCOIND_PASSWORD=password
```

## Setup

### Ports
- JSON-RPC: 8332
- bitcoind: 8333

### Data Directory
The data directory for the blockchain and other bitcoind related files is
located at `/root/.bitcoin`. The default run script creates a named volume
called `blockchain`.

### JSON-RPC Authentication
This docker image automatically generates a password for the JSON-RPC
interface. You can use your own password by overwriting the `BITCOIND_PASSWORD`
environment variable. The username is `btcrpc`.
