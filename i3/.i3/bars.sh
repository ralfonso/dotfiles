#!/usr/bin/env bash

pkill -f polybar
~/.local/bin/polybar main &
~/.local/bin/polybar left &
~/.local/bin/polybar right &
