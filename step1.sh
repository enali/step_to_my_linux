#!/usr/bin/env bash

echo "#### step1. update system"
echo "## config sources"
echo "change sources?"
echo "select sources: 163, aliyun"
sudo apt-get update && sudo apt-get upgrade -y

echo "#### step2. install softwares"
pkgs="vim build-essential cmake curl cscope exuberant-ctags htop irssi tree"
for pkg in $pkgs; do
  sudo apt-get install -y $pkg >/dev/null 2>&1 && printf "$pkg OK!\n" || printf "$pkg NO!\n"
done

echo "#### step3. config mystyle"
echo "## config git"
echo "## config bash"
printf "copy vimrc ..." && cp cfg_dir/vimrc ~/.vimrc && echo "OK"
printf "copy bash_aliases" && cp cfg_dir/bash_aliases ~/.bash_aliases && echo "OK"
printf "copy bash_env" && cp cfg_dir/bash_env ~/.bash_env && echo "OK"
printf "copy tmux.conf" && cp cfg_dir/tmux.conf ~/.tmux.conf && echo "OK"
echo "## config vim"
echo "clone 'VundleVim/vundle.vim'"
git clone https://github.com/VundleVim/vundle.vim ~/.vim/bundle/vundle

