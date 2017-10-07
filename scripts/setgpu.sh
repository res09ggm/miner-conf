#!/usr/bin/env bash
[ -e /opt/miner/miner.conf ] && . /opt/miner/miner.conf

sudo nvidia-smi -pm 1
sudo nvidia-smi -pl ${GPU_POWER_LIMIT}

for i in `seq 0 $((GPU_COUNT - 1))`;
do
  sudo nvidia-settings \
  -a [gpu:$i]/GPUGraphicsClockOffset[2]=${GPU_CORE_CLOCK} \
  -a [gpu:$i]/GPUMemoryTransferRateOffset[2]=${GPU_MEM_CLOCK} \
  -a [gpu:$i]/GPUFanControlState=1 \
  -a [fan:$i]/GPUTargetFanSpeed=${GPU_FAN_SPEED}
done;
