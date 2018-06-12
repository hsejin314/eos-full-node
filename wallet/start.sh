#!/bin/bash
#######################################################
##                                                   ##
## Script Created by CryptoLions, HKEOS and EOS Rio  ##
## For EOS Ghostbusters Testnet                      ##
##                                                   ##
## https://github.com/CryptoLions                    ##
## https://github.com/eosrio                         ##
## https://github.com/HKEOS/Ghostbusters-Testnet     ##
##                                                   ##
#######################################################

DATADIR=/home/sejin/Ghostbusters/wallet
$DATADIR/stop.sh
/home/sejin/eos/build/programs/keosd/keosd --data-dir $DATADIR --http-server-address 127.0.0.1:7777 "$@" > /home/sejin/Ghostbusters/wallet/stdout.txt 2> /home/sejin/Ghostbusters/wallet/stderr.txt  & echo $! > $DATADIR/wallet.pid
echo "Wallet started"
