#!/bin/bash

backup_dir=~/vimback/

# step.1. backup your old configurations
echo "[1] backing up old configurations ..."
if [ -d $backup_dir ]; then
    echo "$backup_dir already exists, refresh it"
    rm $backup_dir -rf
fi
mkdir ~/vimback/
mv ~/.vim_runtime/ $backup_dir
echo "backup successful"
echo ""

# step.2. install
echo "[2] install new configurations ..."
cp .vim_runtime ~ -rf && sh ~/.vim_runtime/install_awesome_vimrc.sh
echo "install finish"
