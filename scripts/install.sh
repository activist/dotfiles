#!/bin/bash

#./symlink.sh
sudo ./apt_install.sh
sudo ./snap_install.sh
sudo ./programs_install.sh
#./desktop.sh
# Get all upgrades
sudo apt upgrade -y
# See our bash changes
source ~/.bashrc
# Fun hello
echo "Done!!!"
