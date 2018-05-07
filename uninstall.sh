#!/bin/bash
# Yanan Zhao, 2016

# backup directory
# with two leading dots to distinguish it from vim configuration files
backup_dir=$HOME/..vimback

# step.1. remove configurations
echo -e "\033[36m[1] removing current configurations ...\033[0m"
rm -rf $HOME/.vim* 

echo -e "\033[34mremove successful\033[0m"
echo -e ""

# step.2. restore old configurations
echo -e "\033[36m[2] restore old configurations ...\033[0m"

if [ ! -d $backup_dir ]; then
    echo -e "$backup_dir not exist, exit"
    exit
fi

cp -rf $backup_dir/.vim* $HOME
echo -e "\033[34mrestore successful\033[0m"

echo -e "\033[34muninstall vim_awesome successful\033[0m"
