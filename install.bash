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

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

sudo apt install \
    terminator \
    vim \
    clang-format-5.0 \
    build-essential \
    cmake \
    curl \
    zsh \
    npm \
    git \
    git-core \
    git-gui \
    gitk \
    tree \
    minicom -y

sudo apt install \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    arduino \
    synergy \
    freecad -y

sudo apt install \
    python3-numpy \
    python3-pandas \
    python3-matplotlib \
    python3-pandas-datareader \
    python3-fix-yahoo-finance -y

# beyond depends
sudo apt install \
    #a
    libboost-dev \
    libmosquitto-dev \
    libjson-c-dev \
    libcurl4-gnutls-dev \
    libboost-system-dev \
    #g
    gawk \
    zlib1g-dev \
    libncurses5-dev \
    subversion \
    #??
    libssl1.0-dev \
    libcurl4-openssl-dev \
    #libboost-all-dev libssl-dev libssl1.0-dev libcurl4-openssl-dev \
    #u
    sshpass \
    jq -y

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
#curl -sSL https://get.docker.com | sh

# heroku
sudo snap install heroku --classic

#me
cd $HOME/repositories
if [ ! -d "me" ]; then
    echo -e "${GREEN}Creating me folder${NC}\n"
    mkdir me
else
    echo -e "${YELLOW}me already created: skipping${NC}\n"
fi


# beyond 
cd $HOME
if [ ! -d "beyond" ]; then
    echo -e "${GREEN}Creating beyond folder${NC}\n"
    mkdir beyond
else
    echo -e "${YELLOW}beyond already created: skipping${NC}\n"
fi

sudo apt upgrade -y

echo -e "${GREEN}Cleaning the cache ... ${NC}\n"
sudo apt-get autoclean -y
sudo apt-get autoremove -y

echo -e "${GREEN}End of installation !!!! ${NC}\n"

