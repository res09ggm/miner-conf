#!/bin/bash
GPU_CLOCK_OFFSET=150
GPU_MEM_OFFSET=1450
sudo nvidia-smi -pm 1
sudo nvidia-smi -pl 80
for i in `seq 0 12`;
do
sudo nvidia-settings -a [gpu:$i]/GPUGraphicsClockOffset[2]=$GPU_CLOCK_OFFSET -a [gpu:$i]/GPUMemoryTransferRateOffset[2]=$GPU_MEM_OFFSET -a [gpu:$i]/GPUFanControlState=1 -a [fan:$i]/GPUTargetFanSpeed=85
done;

#sudo nvidia-settings -a [gpu:4]/GPUGraphicsClockOffset[2]=100 -a [gpu:4]/GPUMemoryTransferRateOffset[2]=1300
