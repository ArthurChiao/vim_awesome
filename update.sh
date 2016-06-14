#!/bin/bash
# Author: Yanan Zhao, 2016-06-14
#
# script to update vim_awesome to the latest

echo ""
echo "Updating vim_awesome ..."

# check whether git is installed
command -v git >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "git needs to be installed"
    echo "Update Abort"
    exit 1
fi

# check if there are unstaged or uncommitted changes
# git status | grep "Changes not staged for commit:" | wc -l >/dev/null
# if [ $? -ge 0 ]; then
#     echo "You have unstaged changes, use $0 -f to discard them"
#     echo "Update Abort"
#     exit 2
# fi

# git status | grep "Changes to be committed:" | wc -l >/dev/null
# if [ $? -ge 0 ]; then
#     echo "You have uncommitted changes, use $0 -f to discard them"
#     echo "Update Abort"
#     exit 3
# fi

# update
git co .
git pull --rebase

./install.sh
echo ""
echo "Update successful"
