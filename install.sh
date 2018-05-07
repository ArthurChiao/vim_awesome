#!/bin/bash
# Yanan Zhao, 2016

vim_runtime_dir=~/.vim_runtime

# step.1. backup your old configurations
echo "[1] backing up old configurations ..."
if [ -d $vim_runtime_dir ]
then
    echo "$vim_runtime_dir exists, skiping backing up"
else
    # backup directory
    # with two leading dots to distinguish it from vim configuration files
    backup_dir=~/..vimback # with two leading dots to distinguish it from vim

    if [ -d $backup_dir ]; then
        echo "$backup_dir already exists, refresh it"
        rm -rf $backup_dir
    fi

    mkdir $backup_dir
    mv ~/.vim* $backup_dir

    echo "backup successful"
fi
echo ""

# step.2. update plugins
echo "[2] updating plugins ..."
.vim_runtime/update_plugins.py
echo "update successful"
echo ""

# step.3. install
echo "[3] install new configurations ..."
find . -name ".ropeproject" -exec rm -rf {} +
cp -rf .vim_runtime ~ && sh ~/.vim_runtime/install_awesome_vimrc.sh
echo "install finish"
