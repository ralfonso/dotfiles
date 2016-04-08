#!/usr/bin/env bash

CMUS=$( cmus-remote -Q 2>/dev/null )
STATUS=$( echo "$CMUS" | grep -o 'status [^\$]\+' | cut -d " " -f 2- )
ARTIST=$( echo "$CMUS" | grep -o 'tag artist [^\$]\+' | cut -d " " -f 3- )
TITLE=$( echo "$CMUS" | grep -o 'tag title [^\$]\+' | cut -d " " -f 3- )

if [[ "${STATUS}" == "playing" ]]; then
  echo "$ARTIST - $TITLE"
fi
