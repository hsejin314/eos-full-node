#!/bin/bash

DATADIR=/home/user/data-dir/wallet
$DATADIR/stop.sh
/home/user/eos-dir/build/programs/keosd/keosd --data-dir $DATADIR --http-server-address 127.0.0.1:7777 "$@" > /home/sejin/Ghostbusters/wallet/stdout.txt 2> /home/sejin/Ghostbusters/wallet/stderr.txt  & echo $! > $DATADIR/wallet.pid
echo "Wallet started"
