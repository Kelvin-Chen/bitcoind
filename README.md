# Bitcoind Docker Image
This is a docker image for bitcoind so that you can easily run a full node.

## Setup

### Ports
- JSON-RPC: 8332
- bitcoind: 8333

### JSON-RPC Authentication
This docker image automatically generates a password for the JSON-RPC
interface. You can use your own password by overwriting the `BITCOIND_PASSWORD`
environment variable. The username is `btcrpc`.
