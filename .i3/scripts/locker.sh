#!/bin/sh
ARGS=(
"--screen=0"
"--blur=5"
#    "-i${HOME}/Pictures/bg_1440p/Linux-Wallpapers-19-2560-x-1920.png"
#    "-i${HOME}/Pictures/backgrounds/0c7e1f_5775038.jpg"
"--insidevercolor=35d75588"
"--insidewrongcolor=d7355588"
"--insidecolor=00000000"
"--ringvercolor=64c784ff"
"--ringwrongcolor=c76484ff"
"--ringcolor=3555d7ff"
"--linecolor=00000000"
"--separatorcolor=6484c7ff"
"--keyhlcolor=35d755ff"
"--bshlcolor=d73555ff")

i3lock "${ARGS[@]}" &
i3lockpid=$!
sleep 2

#winid=`xwininfo -name "i3lock" | grep "Window id" | grep -oE "0x[0-9a-f]+"`
#if [ -z "$winid" ]
#then
#    echo "Could not find i3lock window"
#    exit 1
#fi
#echo $winid
#conky -c "$HOME/.config/conky/conkyrc" -w "$winid" &
#conkypid=$!
#
#wait $i3lockpid
#kill $conkypid

