#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
  echo "❌ Don't run this script as root!"
  exit 1
fi

sudo snap install \
#		auto-cpufreq \
#		discord \
#		ngrok \
		slack \
  		spotify


# Post install commands
#sudo auto-cpufreq --install

echo "Done installing snap packages!"
