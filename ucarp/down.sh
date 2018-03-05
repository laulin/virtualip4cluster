#!/bin/bash

interface=$1
ip=$2

ip addr del "$ip/24" brd + dev "$interface" label "$interface:vip"
