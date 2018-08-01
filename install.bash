#!/bin/bash
##############
# Author: Luis Felipe Moua da Silva


RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m' NC='\033[0m' 
OS=$(lsb_release -si)
VER=$(lsb_release -sr)
OS_NAME=$(lsb_release -sc)

cd ~

sudo apt update

sudo apt install terminator vim clang-format-5.0 build-essential cmake curl zsh synergy -y
sudo apt install git git-core git-gui gitk -y
sudo apt install python-dev python-pip python3-dev python3-pi -y
sudo apt install python3-numpy python3-matplotlib python-numpy python-matplotlib -y
sudo apt install tree minicom -y
curl -sSL https://get.docker.com | sh

# beyond stuffs
sudo apt install libboost-dev libmosquitto-dev mosquitto-dev mosquitto-clients libmosquitto-dev \
    libcurl4-gnutls-dev libjson-c-dev libboost-system-dev libboost-all-dev libncurses5-dev \
    zlib1g-dev gawk libssl-dev libssl1.0-dev subversion libjson-c-dev curl libcurl4-openssl-dev \
    sshpass -y

if [ ! -d "beyond" ]; then
    echo "Creating beyond"
    mkdir beyond
else
    echo "beyond already created: skipping"
fi

# labima stuffs
if [ ! -d "labima" ]; then
    echo "Creating labima"
    mkdir labima
else
    echo "labima already created: skipping"
fi

# lsa stuffs
if [ ! -d "lsa" ]; then
    echo "Creating lsa"
    mkdir labima
else
    echo "lsa already created: skipping"
fi


if [ ! -d ".oh-my-zsh" ]; then
    echo "Intalling oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "oh-my-zsh already installed: skipping"
fi


# Plug Vim
sudo apt install exuberant-ctags -y && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo -e "${GREEN}Configin git ... ${NC}\n"
git config --global user.email "silva.luisfelipe13@gmail.com"
git config --global user.name "Luis Felipe"
git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"
git config --global alias.coma "commit --amend"
git config --global alias.st "status"
git config --global alias.rev "rev-parse HEAD"
git config --global alias.revshort "rev-parse --short HEAD"


sudo apt upgrade -y

echo -e "${GREEN}Cleaning the cache ... ${NC}\n"
sudo apt-get autoclean -y
sudo apt-get autoremove -y

echo -e "${GREEN}End of installation !!!! ${NC}\n"

