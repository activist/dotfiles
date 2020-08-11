#!/bin/bash

sudo add-apt-repository ppa:webupd8team/terminix -y
sudo add-apt-repository ppa:hluk/copyq -y
wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo add-apt-repository "deb http://repository.spotify.com stable non-free" -y
sudo add-apt-repository ppa:daniel.pavel/solaar -y
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | sudo apt-key add -
echo "deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com bionic main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo add-apt-repository ppa:mozillateam/thunderbird-stable -y
wget -O - https://repo.jotta.us/public.gpg | sudo apt-key add -
echo "deb https://repo.jotta.us/debian debian main" | sudo tee /etc/apt/sources.list.d/jotta-cli.list
echo "deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/dropbox.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
sudo add-apt-repository ppa:linuxuprising/java -y
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -



sudo apt-get update

sudo apt-get install -y tilix \
	copyq \
	dropbox python3-gpg \
	google-chrome-stable \
	flameshot \
	firefox \
	intellij-idea-ultimate \
	jotta-cli \
	maven \
	meld \
	nodejs \
	openjdk-8-jdk openjdk-8-jre \
	oracle-java11-set-default oracle-java11-installer \
	shotwell \
	solaar \
	spotify-client \
	sublime-text \
	thunderbird \
	teams

echo "Done installing apt packages!"
