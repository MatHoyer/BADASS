#!/bin/sh
# BADASS P3 — leaf router-4 (same as leaf3).
set -eu
ip link add br0 type bridge
ip link add name vxlan10 type vxlan id 10 dstport 4789

ip link set dev vxlan10 up
ip link set dev br0 up
ip link set dev eth0 up 2>/dev/null || true

brctl addif br0 eth0
brctl addif br0 vxlan10
