#!/usr/bin/env bash

function run_one() {
  p=$1
  path="${HOME}/.cache/${p}.run_one"
  flock -w 1 "${path}" "$@"
}

# run_one light-locker --lock-on-suspend&

 # -locker "light-locker-command -l" \

exec xautolock -detectsleep \
    -time 10 \
    -locker slock \
    -notify 30 \
    -notifier "notify-send -u normal -t 10000 -- 'LOCKING screen in 30 seconds'"
