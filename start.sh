#!/bin/bash
################################################################################
#																			  ##
# For EOS main-net 															  ##
#																			  ##
# https://github.com/acroeos/												  ##
#																			  ##
################################################################################

NODEOS=/home/user/eos_source_DIR/build/programs/nodeos/nodeos
DATADIR=/home/user/script_DIR
$DATADIR/stop.sh
$NODEOS --data-dir $DATADIR --config-dir $DATADIR "$@" > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
