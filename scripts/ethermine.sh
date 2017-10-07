#!/bin/bash
GPU_FORCE_64BIT_PTR=0
GPU_MAX_HEAP_SIZE=100
GPU_USE_SYNC_OBJECTS=1
GPU_MAX_ALLOC_PERCENT=100
GPU_SINGLE_ALLOC_PERCENT=100

#screen -dm bash -c 'ethminer --farm-recheck 200 --cuda --verbosity 9 \
#--stratum us2.ethermine.org:14444 --stratum-client 2 \
#--userpass 8c2fec07c4675f16a6ed44b147816fb80d879c38.1070_1 \
#--cuda-block-size 128 --cuda-grid-size 8192 --cuda-streams 2 --cuda-schedule auto >> /var/log/ethminer/ethminer.log 2>&1'

nohup /usr/local/bin/ethminer --farm-recheck 200 --cuda --verbosity 9 \
--stratum us2.ethermine.org:14444 --stratum-client 2 \
--userpass 68336655ad4f79922ebb099a8dd83b45d8e3d1d1.commerce-10 \
--cuda-streams 2 --cuda-schedule auto >> /var/log/ethminer/ethminer.log 2>&1 &


#--cuda-block-size 256 --cuda-grid-size 15711 --cuda-parallel-hash 2 \

#nvidia-settings -a [gpu:0]/GPUGraphicsClockOffset[3]=-200 -a [gpu:0]/GPUMemoryTransferRateOffset[3]=1400 -a [gpu:0]/GPUPowerMizerMode=1
#sudo -p miner nvidia-smi -pl 100
