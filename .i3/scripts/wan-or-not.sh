#!/bin/zsh
#First arg is icon for WAN IP, Second argument is icon for local IP, third for offline
wanip=$(dig +short myip.opendns.com @resolver1.opendns.com);
if [[ $wanip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  echo "<span foreground='#00CC33'>$1</span>:$wanip"
else
  wanip=$(ip addr show dev wlan0 | grep "inet " | awk  '{print $2}')
  if [[ $wanip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]; then
    echo "<span foreground='#3300CC'>$2</span>:$wanip"
  else
    echo "<span foreground='#CC0033'>$3</span>"
  fi
fi
