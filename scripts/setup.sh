#!/usr/bin/env bash
. /opt/miner/miner.conf
tmp_config_file=/tmp/miner.conf.$$
cp /opt/miner/miner.conf $tmp_config_file

save_config() {
    local config_name=$1
    local config_value=$2

    sed -i "s/^\(${config_name}\s*=\s*\).*\$/\1${config_value}/" "${tmp_config_file}"
}

write_config() {
    mv "${tmp_config_file}" /opt/miner/miner.conf
}

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
    read WORKER_NAME
    save_config WORKER_NAME $WORKER_NAME
fi

echo "Set worker id? ${WORKER_ID}: [y/n]"
read answer
if echo $answer | grep -iq "^y"; then
    echo -n "${WORKER_ID}: "
    read WORKER_ID
    save_config WORKER_ID $WORKER_ID
fi

echo "Set hostname from ${HOSTNAME} to ${WORKER_NAME}-${WORKER_ID}?"
read answer
if echo $answer | grep -iq "^y"; then
    sudo sed -i "s/^${HOSTNAME}/${WORKER_NAME}-${WORKER_ID}/" /etc/hosts
    sudo hostnamectl set-hostname "${WORKER_NAME}${WORKER_ID}"
fi

echo "Print config?"
read answer
if echo $answer | grep -iq "^y";then
    cat $tmp_config_file
fi

echo "Save config?"
read answer
if echo $answer | grep -iq "^y"; then
    write_config
fi
