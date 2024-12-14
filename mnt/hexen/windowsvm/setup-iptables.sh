#!/bin/sh

iptables -I FORWARD 1 -o br0 -j ACCEPT
iptables -I FORWARD 1 -i br0 -j ACCEPT