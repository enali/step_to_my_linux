#!/bin/bash

BASE="vim git git-core curl elinks cscope exuberant-ctags build-essential imagemagick guake zsh"
SCI="octave r-base r-base-dev r-base-core"
PY="python ipython ipython-notebook python-numpy python-scipy python-matplotlib"
PY3="python3 ipython3 ipython3-notebook python3-numpy python3-scipy python3-matplotlib"
NET="traceroute wireshark aircrack-ng hydra"

PKGS="$BASE $SCI $PY $PY3 $NET"
for pkg in $PKGS; do
    sudo apt-get install -y $pkg >/dev/null 2>&1 && printf "$pkg OK!\n" || print "$pkg NO!\n"
done
