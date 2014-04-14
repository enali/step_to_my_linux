#!/bin/bash
PKGBASE="curl elinks octave exuberant-ctags build-essential imagemagick"
PKGPY="python ipython ipython-notebook python-numpy python-numpy-doc python-scipy python-scipy-doc python-matplotlib python-matplotlib-doc"
PKGPY3="python3 ipython3 ipython3-notebook python3-numpy python3-scipy python-matplotlib"
PKGS="$PKGBASE $PYAPP $PY3APP"

for pkg in $PKGS; do
    if $(which $pkg >/dev/null 2>&1); then
        printf "The $pkg    exist ... \n"
    else
        printf "The $pkg    install ... "
        sudo apt-get install -y $pkg >/dev/null 2>&1 && printf "OK!\n" || printf "NO!\n"
    fi
done
