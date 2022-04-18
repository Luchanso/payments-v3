[bitcoin RPC reference](https://developer.bitcoin.org/reference/rpc/index.html)
[bitcoin.conf example](https://github.com/bitcoin/bitcoin/blob/master/share/examples/bitcoin.conf)

```sh
docker run --rm -it \
  -p 18443:18443 \
  -p 18444:18444 \
  ruimarinho/bitcoin-core \
  -printtoconsole \
  -regtest=1 \
  -rpcallowip=172.17.0.0/16 \
  -rpcbind=0.0.0.0 \
  -fallbackfee=0.0001 \
  -rpcauth='foo:7d9ba5ae63c3d4dc30583ff4fe65a67e$9e3634e81c11659e3de036d0bf88f89cd169c1039e6e09607562d54765c649cc'

# simple way
docker-compose build --progress=plain && docker-compose up
docker exec -it bitcoin-core bash

curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"getnetworkinfo","params":[]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0=@127.0.0.1:18443/
curl --data-binary '{"jsonrpc": "1.0", "id": "2", "method": "createwallet", "params": ["testwallet"]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0=@127.0.0.1:18443/
curl --data-binary '{"jsonrpc": "1.0", "id": "2", "method": "createwallet", "params": ["testwallet2"]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0=@127.0.0.1:18443/
curl --data-binary '{"jsonrpc": "1.0", "id": "3", "method": "getnewaddress", "params": []}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet
curl --data-binary '{"jsonrpc": "1.0", "id": "3", "method": "getnewaddress", "params": []}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet
curl --data-binary '{"jsonrpc": "1.0", "id": "4", "method": "getnewaddress", "params": []}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0=@127.0.0.1:18443/wallet/testwallet2

{"result":"bcrt1qdnc4kpehhx02zazgnq4ajt49m52uxv49d2nxfs","error":null,"id":"3"}
{"result":"bcrt1qfr3g577vncp7u3sh3yr2y98nq8u8u93vry487n","error":null,"id":"3"}
{"result":"bcrt1qfrdt779wc2dlfrss2mqpt2t2qfgmlaf77rgfzf","error":null,"id":"4"}

curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"generatetoaddress","params":[101, ""]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/

# curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"createrawtransaction","params":[]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/

curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"sendtoaddress","params":["", 1]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet

bitcoin-cli -regtest -rpcuser=foo -rpcpassword="qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0=" -rpcwallet=testwallet2 -generate 1

curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"getbalances","params":[]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet

curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"getbalances","params":[]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet2
```
