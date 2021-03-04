#!/bin/sh
CURR_MAP=$(setxkbmap -query | grep layout | sed 's/layout:     //g')
if [ "$CURR_MAP" = "si" ]
then
  setxkbmap us altgr-intl
else
  setxkbmap si
fi
