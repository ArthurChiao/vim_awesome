#!/bin/bash
# Author: Yanan Zhao, 2016-06-14
#         izhuer,     2018-05-07
#
# script to update vim_awesome to the latest

# Usage: update.sh [target_plugin]

target_plugin=$1

cur_vim_runtime_dir=$PWD/.vim_runtime

echo -e ""
echo -e "\033[36mupdating vim_awesome ...\033[0m"

# check whether git is installed
command -v git >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo -e "git needs to be installed"
    echo -e "\033[31mupdate Abort\033[0m"
    exit 1
fi

# check if there are unstaged or uncommitted changes
# git status | grep "Changes not staged for commit:" | wc -l >/dev/null
# if [ $? -ge 0 ]; then
#     echo -e "you have unstaged changes, use $0 -f to discard them"
#     echo -e "update Abort"
#     exit 2
# fi

# git status | grep "Changes to be committed:" | wc -l >/dev/null
# if [ $? -ge 0 ]; then
#     echo -e "you have uncommitted changes, use $0 -f to discard them"
#     echo -e "update Abort"
#     exit 3
# fi

# update

echo -e ""
read -p "only update plugins? [Y/n] " choice
if [ "$choice" != "Y" -a "$choice" != "y" ]; then
    git checkout .
    git checkout master
    git pull --rebase
fi

$cur_vim_runtime_dir/update_plugins.py $target_plugin
if [ $? -gt 0 ]; then
    echo -e "\033[31mupdate abort\033[0m"
    exit 4
fi

echo -e "\033[34mupdate successful\033[0m"
