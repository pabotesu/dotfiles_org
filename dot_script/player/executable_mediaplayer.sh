#!/bin/sh
if [ $$ != `pgrep -fo $0` ]; then
  echo "Already running!" >&2
  exit 1
fi

python3 ~/.script/player/mediaplayer.py

exit 0