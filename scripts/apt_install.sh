#!/bin/bash

#sudo add-apt-repository ppa:webupd8team/terminix -y
sudo add-apt-repository ppa:hluk/copyq -y
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo add-apt-repository ppa:daniel.pavel/solaar -y
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | sudo apt-key add -
#echo "deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com bionic main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo add-apt-repository ppa:mozillateam/thunderbird-stable -y
wget -O - https://repo.jotta.us/public.gpg | sudo apt-key add -
echo "deb https://repo.jotta.us/debian debian main" | sudo tee /etc/apt/sources.list.d/jotta-cli.list
echo "deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/dropbox.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

#sudo add-apt-repository ppa:linuxuprising/java -y
#curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -



sudo apt-get update

sudo apt-get install -y tilix \
	copyq \
	dropbox python3-gpg \
	google-chrome-stable \
	flameshot \
	firefox \
	jotta-cli \
	maven \
	meld \
	solaar \
	spotify-client \
	sublime-text \
	thunderbird

#tenv
LATEST_VERSION=$(curl --silent https://api.github.com/repos/tofuutils/tenv/releases/latest | jq -r .tag_name)
curl -O -L "https://github.com/tofuutils/tenv/releases/latest/download/tenv_${LATEST_VERSION}_amd64.deb"
sudo dpkg -i "tenv_${LATEST_VERSION}_amd64.deb"

echo "Done installing apt packages!"
