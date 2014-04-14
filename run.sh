#!/bin/bash
SRCLIST=sources_buaa
VERS=saucy

. ./pkg.sh
. ./git.sh
. ./ro.sh

#=>     config vim
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
vim +BundleInstall +qall &
#=>     config rvm
if ! $(which rvm >/dev/null 2>&1); then
    printf "Will install rvm: \n"
    curl -sSL https://get.rvm.io | bash -s stable
    . $HOME/.rvm/scripts/rvm
fi
#=>     config sources.list
if [ -f "/etc/apt/sources.list" ]; then
    sudo mv /etc/apt/sources.list /etc/apt/sources.list_bk
fi
cat $SRCLIST || sudo sed s/lzp/$VERS/g > /etc/apt/sources.list 
sudo apt-get update
