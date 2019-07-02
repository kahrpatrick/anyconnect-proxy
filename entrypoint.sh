#!/bin/bash

echo $VPN_PASSWORD | openconnect --user=$VPN_USER --passwd-on-stdin --csd-wrapper=/usr/libexec/openconnect/csd-wrapper.sh --script-tun --script "ocproxy -g -k 60 -D 9052" $VPN_HOST --os=linux-64
