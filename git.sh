#!/bin/bash
if ! $(which git >/dev/null 2>&1); then
    printf "Install git ... "
    sudo apt-get install -y git git-core >/dev/null 2>&1 && printf "OK!\n" || printf "NO!\n"
fi

if [ "$#" = 3 ]; then
    EDITOR=$1
    USER=$2
    EMAIL=$3
else
    EDITOR=vim
    USER=enali
    EMAIL=enalix@163.com
fi

printf "Config git ... "
git config --global core.editor $EDITOR
git config --global user.name $USER
git config --global user.email $EMAIL
git config --global color.ui true
git config --global credential.helper cache
git config --global credential.helper "cache --timeout=3000"
if [ "$?" = 0 ]; then
    printf "OK!\n"
else
    printf "NO!\n"
fi

exit 0
