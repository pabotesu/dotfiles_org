#!/bin/sh

# use in /usr/local/bin/swayon
# 二重起動チェック
_process=`basename $0`

_pcnt=`pgrep -fo ${_process} | wc -l`

if [ ${_pcnt} -gt 1 ]; then
  echo "This script has been running now. proc : ${_pcnt}"
  exit 1
fi

XDG_SESSION_TYPE=wayland
XDG_CURRENT_DESKTOP=sway
XDG_CURRENT_SESSION=sway
LIBSEAT_BACKEND=logind
QT_QPA_PLATFORM=wayland
GDK_DPI_SCALE=1
QT_SCALE_FACTOR=1
MOZ_ENABLE_WAYLAND=1
WINIT_UNIX_BACKEND=x11

export XDG_SESSION_TYPE XDG_CURRENT_DESKTOP XDG_CURRENT_SESSION LIBSEAT_BACKEND QT_QPA_PLATFORM GDK_DPI_SCALE QT_SCALE_FACTOR MOZ_ENABLE_WAYLAND WINIT_UNIX_BACKEND;

sleep 1;
exec sway
