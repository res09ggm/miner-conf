#!/usr/bin/env bash

for file in ../bin/*; do
    sudo ln -s $file /usr/local/bin/$file
done;
