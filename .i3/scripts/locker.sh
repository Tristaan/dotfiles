#!/bin/sh
ARGS=(
    "--clock" "-s"
    "-i${HOME}/Pictures/backgrounds/6164e8_5775038.png"
    "--insidevercolor=35d75588"
    "--insidewrongcolor=d7355588"
    "--insidecolor=50505000"
    "--ringvercolor=64c784ff"
    "--ringwrongcolor=c76484ff"
    "--ringcolor=3555d7ff"
    "--separatorcolor=6484c7ff"
    "--keyhlcolor=35d755ff"
    "--bshlcolor=d73555ff")
i3lock "${ARGS[@]}"
