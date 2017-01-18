#!/usr/bin/env bash

pkill -f polybar

display_count=$(xrandr | grep -c ' connected')

if [[ "${display_count}" -eq 1 ]];
then
  ~/.local/bin/polybar main &
else
  ~/.local/bin/polybar main &
  ~/.local/bin/polybar left &
  ~/.local/bin/polybar right &
fi
