#!/bin/bash

DATADIR=/opt/eos-full-node/wallet
$DATADIR/stop.sh
/opt/eos/build/programs/keosd/keosd --data-dir $DATADIR --http-server-address 127.0.0.1:7777 "$@" > /opt/eos-full-node/wallet/stdout.txt 2> /opt/eos-full-node/wallet/stderr.txt  & echo $! > $DATADIR/wallet.pid
echo "Wallet started"
