#!/bin/bash
################################################################################
#																		
# For EOS main-net 															  
#																			 
# https://github.com/acroeos/eos-full-node										
#																			  
################################################################################

NODEOS=/opt/eos/build/programs/nodeos/nodeos
DATADIR=/opt/eos-full-node/
$DATADIR/stop.sh
$NODEOS --data-dir $DATADIR --config-dir $DATADIR "$@" > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
