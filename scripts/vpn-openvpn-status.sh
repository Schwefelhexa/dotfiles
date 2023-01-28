#!/bin/sh

# From: https://github.com/polybar/polybar-scripts/blob/master/polybar-scripts/vpn-openvpn-status/vpn-openvpn-status.sh

pgrep -a openconnect$ | head -n 1 | awk '{print $NF }' && echo down | head -n 1

