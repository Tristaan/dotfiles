#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	export COLOR_CYAN="#8be9fd"
	export COLOR_BLUE="#6272a4"
	export COLOR_GREEN="#50fa7b"
    export LABEL_MOUNTED="%{F$COLOR_CYAN}%mountpoint%%{F-}:%free%"
    export LABEL_NETWORK_CONNECTED="%{F$COLOR_CYAN}%local_ip%%{F-}:%downspeed:4%"
    MONITOR=$m polybar --reload top &
    MONITOR=$m polybar --reload bottom &
  done
else
  polybar --reload top &
fi

echo "Bars launched..."
