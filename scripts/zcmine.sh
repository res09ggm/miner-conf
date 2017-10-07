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

nohup /usr/local/bin/zecminer \
--server us1-zcash.flypool.org \
--port 3333 \
--user t1NykkwsZqDEhSTDaG7HZYXiY5X1SeJZxcj.1070_1 \
--fee 0 \
--pec \
--log 2 \
--logfile zecminer.log &
