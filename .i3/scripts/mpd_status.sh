#!/bin/sh
SONG=$(mpc current)

for i in $(mpc --format ""); do
    a=$i
    break
done

case $BLOCK_BUTTON in
	2) mpc toggle ;;
	1) mpc prev ;;
	3) mpc next ;;
esac

if [ -z "$SONG" ]; then
	OUT="<span foreground='#CC0033'></span>"
else
	if [ $a = "[playing]" ]; then
		OUT="<span foreground='#00CC33'></span>" 
	else
		OUT="<span foreground='#CC0033'></span>"
	fi
	OUT="$OUT <span foreground='#6484C7'>$SONG</span>"
fi
echo $OUT
