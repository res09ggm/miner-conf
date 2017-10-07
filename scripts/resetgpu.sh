#!/bin/bash
[ -e /opt/miner/miner.conf ] && . /opt/miner/miner.conf

for i in `seq 0 $((GPU_COUNT - 1))`;
do
    sudo nvidia-settings -a [gpu:$i]/GPUGraphicsClockOffset[2]=0 -a [gpu:$i]/GPUMemoryTransferRateOffset[2]=0 -a [gpu:$i]/GPUFanControlState=0
done;
