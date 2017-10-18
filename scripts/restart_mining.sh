#!/usr/bin/env bash
[ -e /opt/miner/miner.conf ] && . /opt/miner/miner.conf

sudo pkill -f -9 ethminer

/opt/miner/scripts/resetgpu.sh
/opt/miner/scripts/setgpu.sh
/opt/miner/scripts/ethermine.sh
