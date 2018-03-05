#!/bin/bash

# HELP
# This script set a ucarp instance to create VIP.
# It run in forground so you can use it in supervisor
# 
# arguments:
# 1 : destination interface
# 2 : the virtual ip
# 3 : the shared secret
#
# Example:
# /opt/ucarp/run.sh eth0 10.5.0.250 my_secret

interface=$1
vip=$2
secret=$3

_term() { 
  echo "Caught SIGTERM signal!" 
  kill -TERM "$child" 2>/dev/null
}

trap _term SIGTERM

IP=$(ip addr show dev $interface | grep -P "inet \d+\.\d+\.\d+\.\d+" |grep -Po "\d+\.\d+\.\d+\.\d+" | head -n1)
ucarp -i "$interface" -s "$IP" -v 1 -p "$secret" -a "$vip" -u /opt/ucarp/up.sh -d /opt/ucarp/down.sh -z&

child=$! 
wait "$child"