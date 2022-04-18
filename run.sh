#!/bin/sh

docker run --rm -it \
  --name bitcoin-core \
  -p 8332:8332 \
  -p 8333:8333 \
  -p 18443:18443 \
  -p 18444:18444 \
  ruimarinho/bitcoin-core \
  -printtoconsole \
  -regtest=1 \
  -rpcallowip=172.17.0.0/16 \
  -rpcbind=0.0.0.0 \
  -fallbackfee=0.0001 \
  -rpcauth='foo:7d9ba5ae63c3d4dc30583ff4fe65a67e$9e3634e81c11659e3de036d0bf88f89cd169c1039e6e09607562d54765c649cc'