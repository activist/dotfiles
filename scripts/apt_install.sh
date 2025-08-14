e#!/bin/bash

# prerequisites
sudo apt update
sudo apt install -y curl wget apt-transport-https ca-certificates jq


#sudo add-apt-repository ppa:webupd8team/terminix -y
curl -sSL -O https://packages.microsoft.com/config/ubuntu/25.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo add-apt-repository ppa:hluk/copyq -y

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo add-apt-repository ppa:solaar-unifying/stable
sudo add-apt-repository ppa:daniel.pavel/solaar -y
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
#cannot be run multiple times wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
#sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | sudo apt-key add -
#echo "deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com bionic main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo add-apt-repository ppa:mozillateam/thunderbird-stable -y

sudo curl -fsSL https://repo.jotta.cloud/public.asc -o /usr/share/keyrings/jotta.gpg
echo "deb [signed-by=/usr/share/keyrings/jotta.gpg] https://repo.jotta.cloud/debian debian main" | sudo tee /etc/apt/sources.list.d/jotta-cli.list

# Vivaldi
wget -q -0 https://downloads.vivaldi.com/stable/vivaldi-stable_7.5.3735.62-1_amd64.deb
sudo apt-get -y install ./vivaldi*.deb
rm ./vivaldi-stable_7.5.3735.62-1_amd64.deb

# Dropbox
wget -q -0 https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2025.05.20_amd64.deb
sudo apt-get -y install ./dropbox_2025.05.20_amd64.deb
rm dropbox_2025.05.20_amd64.deb

# Zettlr
curl -s --compressed "https://apt.zettlr.com/KEY.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/zettlr_apt.gpg > /dev/null
# Second, add this repository to your sources
sudo curl -s --compressed -o /etc/apt/sources.list.d/zettlr.list "https://apt.zettlr.com/zettlr.list"

# k9s
wget https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb && apt install ./k9s_linux_amd64.deb && rm k9s_linux_amd64.deb

# Docker (ce)
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#tenv
LATEST_VERSION=$(curl --silent https://api.github.com/repos/tofuutils/tenv/releases/latest | jq -r .tag_name)
curl -O -L "https://github.com/tofuutils/tenv/releases/latest/download/tenv_${LATEST_VERSION}_amd64.deb"
sudo dpkg -i "tenv_${LATEST_VERSION}_amd64.deb"


sudo apt-get update

#libfuse2 is required by Jetbrains toolbox

sudo apt-get install -y tilix \
	copyq \
  	docker-ce \
   	docker-ce-cli \
	containerd.io \
 	dotnet-sdk-8.0 \
  	aspnetcore-runtime-8.0 \
 	dotnet-sdk-9.0 \
  	aspnetcore-runtime-9.0 \
	dropbox python3-gpg \
 	git \
	#google-chrome-stable \
	flameshot \
	firefox \
 	filezilla \
	jotta-cli \
 	libfuse2 \
	maven \
	meld \
	solaar \
	spotify-client \
	sublime-text \
	thunderbird \
 	zettlr

# Github CLI
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

echo "Done installing apt packages!"
