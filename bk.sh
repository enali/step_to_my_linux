#!/bin/bash
DSTDIR=backups
BKDIR="*code vimwiki .NERDTreeBookmarks .vimrc .bash_aliases"
if [ "$#" = 1 ]; then
    DSTDIR=$1
fi
cd $HOME
if [ ! -d "$DSTDIR" ]; then
    mkdir $DSTDIR
fi
printf "Will backup to $DSTDIR for you ...\n"
tar -jcvp -f $DSTDIR/bk.$(date +%Y-%m-%d).tar.bz2 $BKDIR

exit 0
