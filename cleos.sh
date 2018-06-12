#!/bin/bash
################################################################################
#															                				  
# For EOS main-net 															  
#																			  
# https://github.com/acroeos/eos-full-node												  
#																			  
################################################################################

## dir to eos-source->client
CLEOS=/opt/eos/build/programs/cleos/cleos
$CLEOS -u http://127.0.0.1:8881 --wallet-url http://127.0.0.1:55551 "$@"
#$CLEOS -u <API adress> --wallet-url <wallet url> "$@"



