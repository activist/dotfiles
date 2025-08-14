#!/bin/bash

#./symlink.sh
./apt_install.sh
./snap_install.sh 
./programs_install.sh
#./desktop.sh
# Get all upgrades
sudo apt upgrade -y
# See our bash changes
source ~/.bashrc
# Fun hello
echo "Done!!!"
