#!/usr/bin/env bash

pkill -f polybar

display_count=$(xrandr | grep -c ' connected')
lconf=~/.config/polybar/laptop
dconf=~/.config/polybar/desktop

if [[ "${display_count}" -eq 1 ]];
then
  MONITOR=eDP-1 ~/.local/bin/polybar -c ${lconf} main &
else
  MONITOR=DP-0 ~/.local/bin/polybar -c ${dconf} main &
  MONITOR=DP-2 ~/.local/bin/polybar -c ${dconf} left &
  MONITOR=DP-4 ~/.local/bin/polybar -c ${dconf} right &
fi
