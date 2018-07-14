#!/bin/sh
cd ~

sudo apt-get update

sudo apt-get install python-pip python3-pip python python3

sudo pip install --user nilearn
sudo pip install --user scikit-learn

sudo apt-get install python-setuptools python-dev build-essential python-numpy python-scipy python-matplotlib ipython ipython3 python-pandas python-sympy python-nose

if [ ! -d "labima" ]; then
    echo "Creating LABIMA folder"
    mkdir labima
else
    echo "LABIMA folder already exists: skipping"
fi

git config --global user.email "silva.luisfelipe13@gmail.com"
git config --global user.name "Luis Felipe"

