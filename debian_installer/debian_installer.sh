#!/bin/sh

##########################
#### DEBIAN INSTALLER ####
##########################


# Update packages
apt update
# Zsh
apt install -y zsh zsh-doc && chsh -s /bin/zsh

# Sudo
apt install -y sudo
adduser morgan sudo

# openvpn
apt-get install -y openvpn network-manager network-manager-openvpn network-manager-openvpn-gnome

# Tools
apt install -y openssh-server git vlc libreoffice vim pgadmin3 tmux wget curl firefox-esr firefox-esr-l10n-fr apt-transport-https make ca-certificates gnupg2 software-properties-common



# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb



# Sdkman
curl -s "https://get.sdkman.io" | zsh
sdk install java groovy kotlin spring gradle maven ant springboot

# Nvm 
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | zsh
nvm install node
nvm use node

# Vagrant
apt install vagrant virtualbox virtualbox-dkms

# Docker
wget -qO- https://get.docker.com/ | sh
usermod -aG docker $(whoami)

# Docker compose
pip install docker-compose


# Intellij manually


# Zsh conf
git clone https://github.com/dotmobo/dotzsh.git ~/.zsh
ln -s ~/.zsh/zshrc ~/.zshrc
ln -s ~/.zsh/zshenv ~/.zshenv

# Vim conf
git clone --recursive https://github.com/morganbohn/dotvim.git ~/.vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
ln -s ~/.vim/vimrc ~/.vimrc
vim +NeoBundleInstall +qall
