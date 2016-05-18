#!/bin/bash
# Yanan Zhao, 2016

# backup directory
# with two leading dots to distinguish it from vim configuration files
backup_dir=~/..vimback

# step.1. remove configurations
echo "[1] removing current configurations ..."
rm ~/.vim* -rf

echo "successful"
echo ""

# step.2. restore old configurations
echo "[2] restore old configurations ..."

if [ ! -d $backup_dir ]; then
    echo "$backup_dir not exist, exit"
    exit
fi

cp $backup_dir/.vim* ~ -rf
echo "successful"

echo "uninstall vim_awesome successful"
