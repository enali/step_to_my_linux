#!/bin/bash

BASE="vim emacs cmake curl elinks cscope exuberant-ctags build-essential imagemagick guake zsh postgresql tmux subversion unity-tweak-tool htop sysstat mutt irssi rtorrent ranger tree"
SCI="octave scilab r-base r-base-dev r-base-core graphviz texlive"
PY="python ipython ipython-notebook python-numpy python-scipy python-matplotlib"
PY3="python3 ipython3 ipython3-notebook python3-numpy python3-scipy python3-matplotlib"
NET="traceroute wireshark aircrack-ng hydra"
LLVM="llvm-3.5 llvm-3.5-dev clang-3.5 clang-3.5-dev lldb-3.5 lldb-3.5-dev libc++1 libc++-dev libc++abi1 libc++abi-dev"

PKGS="$BASE $SCI $PY $PY3 $NET"
for pkg in $PKGS; do
    sudo apt-get install -y $pkg >/dev/null 2>&1 && printf "$pkg OK!\n" || print "$pkg NO!\n"
done
