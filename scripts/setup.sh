#!/usr/bin/env bash

for file in ../bin/*; do
    filename=`basename $file`
    sudo ln -s $file /usr/local/bin/$filename
done;
