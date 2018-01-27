#!/bin/sh
ARGS=(
"--screen=0"
"--blur=5"
#    "-i${HOME}/Pictures/bg_1440p/Linux-Wallpapers-19-2560-x-1920.png"
#    "-i${HOME}/Pictures/backgrounds/0c7e1f_5775038.jpg"
"--timepos=x-90:h-ch+30"
"--datepos=tx+24:ty+25"
"--clock"
"--timecolor=dfdfdfff"
"--datecolor=dfdfdfff"
"--insidevercolor=35d75588"
"--insidewrongcolor=d7355588"
"--insidecolor=00000000"
"--ringvercolor=64c784ff"
"--ringwrongcolor=c76484ff"
"--ringcolor=3555d7ff"
"--linecolor=00000000"
"--radius=24"
"--indpos=x+282:h-70"
"--separatorcolor=6484c7ff"
"--keyhlcolor=35d755ff"
"--bshlcolor=d73555ff"
"--veriftext=''" "--wrongtext=''")

i3lock "${ARGS[@]}" &
i3lockpid=$!
sleep 2
