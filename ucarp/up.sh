#!/bin/bash

interface=$1
ip=$2

ip addr add "$ip/24" brd + dev "$interface" label "$interface:vip"