#!/bin/bash

BASE="vim emacs cmake curl cscope exuberant-ctags build-essential imagemagick guake zsh subversion unity-tweak-tool htop sysstat mutt irssi rtorrent ranger tree"

PKGS="$BASE $SCI $PY $PY3 $NET"
for pkg in $PKGS; do
    sudo apt-get install -y $pkg >/dev/null 2>&1 && printf "$pkg OK!\n" || print "$pkg NO!\n"
done
