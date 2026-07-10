#!/bin/sh
# BADASS P3 — Linux side for leaf router-2 (VTEP): bridge host port + headless VXLAN (EVPN fills remotes).
set -eu
ip link add br0 type bridge
ip link add name vxlan10 type vxlan id 10 dstport 4789

ip link set dev vxlan10 up
ip link set dev br0 up
ip link set dev eth1 up 2>/dev/null || true

brctl addif br0 eth1
brctl addif br0 vxlan10
