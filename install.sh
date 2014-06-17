#!/bin/bash
# Yanan Zhao, 2016

UPDATE_PLUGINS=0

print_help() {
    echo "Usage: $0 [Options]"
    echo "Options:"
    echo "  -h/--help           print this help message and exit"
    echo "  -u/--update-plugins use lasted plugins on install. Default false."
    echo "                      NOTE this may be time-consuming as it will"
    echo "                      pull the plugins from github"
}

if [ $# -eq 1 ]; then
    if [[ $1 = "-h" || $1 = "--help" ]]; then
        print_help
        exit 1
    elif [[ $1 = "-u" || $1 = "--update-plugins" ]]; then
        echo "update plugins: true"
        UPDATE_PLUGINS=1
    else
        echo "unkown options: $@"
    fi
fi

# step.1. backup your old configurations
echo -e "\033[36m[1] backing up current configurations ...\033[0m"

# with two leading dots to distinguish it from vim configuration files
BACKUP_DIR=$HOME/..vimback

if [ -d $BACKUP_DIR ]; then
    echo -e "$BACKUP_DIR already exists, refresh it"
    rm -rf $BACKUP_DIR
fi

mkdir $BACKUP_DIR
mv $HOME/.vim* $BACKUP_DIR

echo -e "\033[34mbackup successful\033[0m"
echo -e ""

# step.2. update plugins
echo -e "\033[36m[2] updating plugins ...\033[0m"
if [ $UPDATE_PLUGINS -eq 1 ]; then
    # $SRC_DIR/update_plugins.py
    # if [ $? -gt 0 ]; then
    #     echo -e "\033[31minstall abort\033[0m"
    #     exit 1
    # fi
    echo -e "\033[34mupdate successful\033[0m"
else
    echo -e "\033[34mskip updating plugins as -u/--update-plugins not specified\033[0m"
fi
echo -e ""

# step.3. install
echo -e "\033[36m[3] install new configurations ...\033[0m"
cp -rf vim_runtime $HOME/.vim_runtime
cp -rf vimrc $HOME/.vimrc
echo -e "\033[34minstall successful, enjoy it :-)\033[0m"
