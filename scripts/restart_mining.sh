#!/bin/bash

sudo pkill -f -9 ethminer

sudo /usr/local/bin/resetgpu.sh
sudo /usr/local/bin/setgpu.sh
/usr/local/bin/ethermine.sh
