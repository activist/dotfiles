#!/bin/bash

sudo snap install auto-cpufreq \
		ngrok \
		slack


# Post install commands
sudo auto-cpufreq --install

echo "Done installing snap packages!"
