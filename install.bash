#!/bin/bash
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

sudo apt install terminator \
    vim \
    clang-format-5.0 \
    build-essential \
    cmake \
    curl \
    zsh \
    npm \
    synergy \
    git \
    git-core \
    git-gui \
    gitk \
    arduino \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    python3-numpy \
    python3-matplotlib \
    python-numpy \
    python-matplotlib \
    quandl \
    tree \
    minicom \
    freecad -y

# beyond depends
sudo apt install libboost-dev libmosquitto-dev \
    mosquitto-dev mosquitto-clients libmosquitto-dev \
    libcurl4-gnutls-dev libjson-c-dev libboost-system-dev \
    libboost-all-dev libncurses5-dev zlib1g-dev gawk libssl-dev \
    libssl1.0-dev subversion libjson-c-dev curl libcurl4-openssl-dev \
    sshpass jq -y


if [ ! -d ".oh-my-zsh" ]; then
    echo -e "${GREEN}Intalling oh-my-zsh ... ${NC}\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo -e "${YELLOW}oh-my-zsh already installed: skipping${NC}\n"
fi


# Plug Vim
echo -e "${GREEN}Intalling Plug Vim... ${NC}\n"
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
git config --global core.editor "vim"



# docker
echo -e "${GREEN}Installing docker${NC}\n"
curl -sSL https://get.docker.com | sh

cd $HOME
if [ ! -d "repositories" ]; then
    echo -e "${GREEN}Creating repositories${NC}\n"
    mkdir repositories
else
    echo -e "${YELLOW}repositories already created: skipping${NC}\n"
fi

#me
if [ ! -d "me" ]; then
    echo -e "${GREEN}Creating me folder${NC}\n"
    mkdir me
else
    echo -e "${YELLOW}me already created: skipping${NC}\n"
fi


# beyond 
if [ ! -d "beyond" ]; then
    echo -e "${GREEN}Creating beyond folder${NC}\n"
    mkdir beyond
else
    echo -e "${YELLOW}beyond already created: skipping${NC}\n"
fi

# LABIMA
if [ ! -d "labima" ]; then
    echo -e "${GREEN}Creating labima folder${NC}\n"
    mkdir labima
else
    echo -e "${YELLOW}labima already created: skipping${NC}\n"
fi


# lsa 
if [ ! -d "lsa" ]; then
    echo -e "${GREEN}Creating lsa folder${NC}\n"
    mkdir lsa
else
    echo -e "${YELLOW}lsa already created: skipping${NC}\n"
fi

# lmf 
if [ ! -d "lmf" ]; then
    echo "${GREEN}Creating lmf folder${NC}\n"
    mkdir lmf
else
    echo -e "${YELLOW}lmf already created: skipping${NC}\n"
fi


sudo apt upgrade -y

echo -e "${GREEN}Cleaning the cache ... ${NC}\n"
sudo apt-get autoclean -y
sudo apt-get autoremove -y

echo -e "${GREEN}End of installation !!!! ${NC}\n"

