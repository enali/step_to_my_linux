#!/bin/bash

#git var, please change it
EDITOR=vim
USER=enali
EMAIL=enalix@163.com

SRCFILE=apt_sources
VERS=trusty

#=> install packages
PKGBASE="vim git git-core curl elinks octave exuberant-ctags build-essential imagemagick guake awesome"
PKGPY="python ipython ipython-notebook python-numpy python-scipy python-matplotlib"
PKGPY3="python3 ipython3 ipython3-notebook python3-numpy python3-scipy python3-matplotlib python3-tk"
PKGS="$PKGBASE $PKGPY $PKGPY3"
for pkg in $PKGS; do
    sudo apt-get install -y $pkg >/dev/null 2>&1 && printf "$pkg OK!\n" || printf "$pkg NO!\n"
done

#=> configure git
git config --global core.editor $EDITOR
git config --global user.name $USER
git config --global user.email $EMAIL
git config --global color.ui true
git config --global credential.helper cache
git config --global credential.helper "cache --timeout=3000"

#=>	config bash
ln -s bash_aliases $HOME/.bash_aliases
#=> config vim
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
vim +PluginInstall +qall
ln -s vimrc $HOME/.vimrc
#=> config rvm
if ! $(which rvm >/dev/null 2>&1); then
    printf "install rvm ... \n"
    curl -sSL https://get.rvm.io | bash -s stable
    . $HOME/.rvm/scripts/rvm
fi
#=> config sources.list
sudo mv /etc/apt/sources.list /etc/apt/sources.list_bk
sed -i "s/lzp/$VERS/g" $SRCFILE
sudo mv $SRCFILE /etc/apt/sources.list
sudo apt-get update && sudo apt-get -y upgrade
