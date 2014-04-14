#!/bin/bash
SRCDIR=backups
DSTDIR=$HOME
if [ "$#" = 2 ]; then
    SRCDIR=$1
    DSTDIR=$2
fi
printf "Will recovery ... "
tar -jxf $SRCDIR/bk.*.tar.bz2 -C $DSTDIR >/dev/null 2>&1 && printf "OK!\n" || printf "NO!\n"

exit 0
