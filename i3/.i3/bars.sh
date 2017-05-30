#!/usr/bin/env bash

pkill -f polybar

display_count=$(xrandr | grep -c ' connected')

if [[ "${display_count}" -eq 1 ]];
then
  ~/.local/bin/polybar main &
else
  MONITOR=DP-0 ~/.local/bin/polybar main &
  MONITOR=DP-2 ~/.local/bin/polybar left &
  MONITOR=DP-4 ~/.local/bin/polybar right &
fi
