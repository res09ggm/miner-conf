#!/usr/bin/env bash
[ -e /opt/miner/miner.conf ] && . /opt/miner/miner.conf

sudo pkill -f -9 ethminer

/usr/local/bin/resetgpu.sh
/usr/local/bin/setgpu.sh
/usr/local/bin/ethermine.sh
