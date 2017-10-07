#!/bin/bash
GPU_CLOCK_OFFSET=0
GPU_MEM_OFFSET=0

for i in `seq 0 12`;
do
sudo nvidia-settings -a [gpu:$i]/GPUGraphicsClockOffset[3]=$GPU_CLOCK_OFFSET -a [gpu:$i]/GPUMemoryTransferRateOffset[3]=$GPU_MEM_OFFSET -a [gpu:$i]/GPUFanControlState=0
done;
