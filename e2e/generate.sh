curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"getnetworkinfo","params":[]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/
curl --data-binary '{"jsonrpc": "1.0", "id": "2", "method": "createwallet", "params": ["testwallet"]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/
curl --data-binary '{"jsonrpc": "1.0", "id": "2", "method": "createwallet", "params": ["testwallet2"]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/
curl --data-binary '{"jsonrpc": "1.0", "id": "3", "method": "getnewaddress", "params": []}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet
curl --data-binary '{"jsonrpc": "1.0", "id": "3", "method": "getnewaddress", "params": []}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet
curl --data-binary '{"jsonrpc": "1.0", "id": "4", "method": "getnewaddress", "params": []}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0=@127.0.0.1:18443/wallet/testwallet2

# {"result":"bcrt1qdnc4kpehhx02zazgnq4ajt49m52uxv49d2nxfs","error":null,"id":"3"}
# {"result":"bcrt1qfr3g577vncp7u3sh3yr2y98nq8u8u93vry487n","error":null,"id":"3"}
# {"result":"bcrt1qfrdt779wc2dlfrss2mqpt2t2qfgmlaf77rgfzf","error":null,"id":"4"}

curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"generatetoaddress","params":[101, ""]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/

# curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"createrawtransaction","params":[]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/

curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"sendtoaddress","params":["", 1]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet

docker exec -it bitcoin-core bash
bitcoin-cli -regtest -rpcuser=foo -rpcpassword="qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0=" -rpcwallet=testwallet2 -generate 1

curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"getbalances","params":[]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet
curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"getbalances","params":[]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet2
curl --data-binary '{"jsonrpc":"1.0","id":"1","method":"estimatesmartfee","params":[1048576]}' http://foo:qDDZdeQ5vw9XXFeVnXT4PZ--tGN2xNjjR4nrtyszZx0\=@127.0.0.1:18443/wallet/testwallet1
