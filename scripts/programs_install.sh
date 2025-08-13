#!/bin/bash

mkdir -p ~/apps
cd ~/apps
pwd

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

#tenv
LATEST_VERSION=$(curl --silent https://api.github.com/repos/tofuutils/tenv/releases/latest | jq -r .tag_name)
curl -O -L "https://github.com/tofuutils/tenv/releases/latest/download/tenv_${LATEST_VERSION}_amd64.deb"
sudo dpkg -i "tenv_${LATEST_VERSION}_amd64.deb"

#nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

curl -0 -L https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.8.1.52155.tar.gz
tar -xzf jetbrains-toolbox-2.8.1.52155.tar.gz && cd jetbrains-toolbox-2.8.1.52155/bin && ./jetbrains-toolbox
rm jetbrains-toolbox-2.8.1.52155.tar.gz

echo "Done installing programs!"
