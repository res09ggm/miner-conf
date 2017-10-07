#!/usr/bin/env bash
. /opt/miner/miner.conf

echo "Continue with setup? [y/n]"
read answer
if echo $answer | grep -iq "^n"; then
    exit 1
fi

if [ -z `echo $PATH | grep /opt/miner/bin` ]; then
    sudo bash -c 'echo "PATH=${PATH}:/opt/miner/bin" >> /etc/.profile'
    . /etc/.profile
fi

echo "Set worker name? ${WORKER_NAME}: [y/n]"
read answer
if echo $answer | grep -iq "^y"; then
    echo -n "${WORKER_NAME}: "
    read answer
    TMP_WORKER_NAME=$answer
fi

echo "Set worker id? ${WORKER_ID}: [y/n]"
read answer
if echo $answer | grep -iq "^y"; then
    echo -n "${WORKER_ID}: "
    read answer
    TMP_WORKER_ID=$answer
fi
