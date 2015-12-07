#!/bin/bash
if [ -d ~/ycm_build ]; then
  rm -rf ~/ycm_build
fi

VUNDLE_DIR=~/.vim/bundle/vundle
YCM_DIR=~/.vim/bundle/YouCompleteMe

if [ ! -d $VUNDLE_DIR ]; then
  echo "You haven't git clone 'VundleVim/Vundle.vim'"
  exit 1
fi
if [ ! -d $YCM_DIR ]; then
  echo "You haven't git clone 'Valloric/YouCompleteMe'"
  exit 2
fi

if $(which cmake >/dev/null 2>&1); then
  echo "no cmake"
  sudo apt-get install cmake
fi

if [ -z "$LLVM_HOME" ]; then
  echo "not $LLVM_HOME seted"
  exit 3
fi

mkdir ~/ycm_build && cd ~/ycm_build
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=$LLVM_HOME . $YCM_DIR/third_party/ycmd/cpp
make ycm_support_libs
