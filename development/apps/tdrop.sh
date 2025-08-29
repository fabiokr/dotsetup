#!/usr/bin/env bash

# tdrop can set up drop down windows for multiple programs
START_DIR=$(pwd)
cd /tmp
git clone https://github.com/noctuid/tdrop.git
cd tdrop
sudo make install
cd -
rm -rf tdrop
cd $START_DIR
