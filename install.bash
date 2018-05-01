#!/bin/bash

cd ~

sudo apt update

sudo apt install terminator vim clang-format-5.0 build-essential cmake curl zsh synergy -y
sudo apt install git git-core git-gui gitk -y
sudo apt install python-dev python-pip python3-dev python3-pi -y
sudo apt install python3-numpy python3-matplotlib python-numpy python-matplotlib -y
curk -sSL https://get.docker.com | sh

# beyond stuffs
sudo apt install libboost-dev mosquitto-dev mosquitto-clients libmosquitto-dev libcurl4-gnutls-dev libjson-c-dev \
    libboost-system-dev libncurses5-dev zlib1g-dev gawk libssl-dev libssl1.0-dev subversion -y

# Plug Vim
sudo apt install exuberant-ctags -y && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# labima stuffs

if [ ! -d ".oh-my-zsh" ]; then
	echo "Intalling oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
	echo "oh-my-zsh already installed: skipping"
fi

if [ ! -d "beyond" ]; then
	echo "Creating beyond"
	mkdir beyond
else
	echo "beyond already created: skipping"
fi

if [ ! -d "labima" ]; then
	echo "Creating labima"
	mkdir labima
else
	echo "labima already created: skipping"
fi

git config --global user.email "silva.luisfelipe13@gmail.com"
git config --global user.name "Luis Felipe"

sudo apt upgrade -y
