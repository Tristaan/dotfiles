#!/bin/sh
i3-msg "append_layout $1" && bash $HOME/.i3/scripts/term_runner.sh -d "$2" -d "$2" -d "$2" -d "$HOME"
