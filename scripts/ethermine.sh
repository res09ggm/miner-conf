#!/bin/bash
GPU_FORCE_64BIT_PTR=0
GPU_MAX_HEAP_SIZE=100
GPU_USE_SYNC_OBJECTS=1
GPU_MAX_ALLOC_PERCENT=100
GPU_SINGLE_ALLOC_PERCENT=100

nohup /usr/local/bin/ethminer --farm-recheck 200 --cuda --verbosity 9 \
--stratum $ETH_STRATUM_URL:$ETH_STRATUM_PORT --stratum-client 2 \
--user $ETH_WALLET_ADDRESS.$WORKER_NAME-$WORKER_ID \
--cuda-streams 2 --cuda-schedule auto >> $ETH_LOG 2>&1 &

#--cuda-block-size 512 --cuda-grid-size 15670 --cuda-streams 2 --cuda-schedule auto >> /var/log/ethminer/ethminer.log 2>&1 &
#--cuda-block-size 256 --cuda-grid-size 15711 --cuda-parallel-hash 2 \
