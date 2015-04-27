#!/usr/bin/env bash
cmd=ibus-table-createdb
src=wubi98.txt
db=wubi98.db
icon=wubi98.svg
addr=/usr/share/ibus-table

if ! $(which $cmd >/dev/null 2>&1); then
  echo "can't find $cmd"
  exit 1
fi
echo "create db from txt..."
$cmd -s $src
echo "cp $db to ibus tables..."
sudo cp $db $addr/tables
echo "cp $icon to ibus icons..."
sudo cp $icon $addr/icons
echo "rm $db..."
rm $db
