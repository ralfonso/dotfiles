#!/bin/bash
#
# Sample .xinitrc for SuSE Linux
# This script is called from 'startx' when you start an X session
#

#
# In case everything goes wrong, we at least fall back to a plain xterm
#
failsafe="xterm -ls -T Failsafe -geometry 80x24-0-0"
trap "exec $failsafe" EXIT SIGHUP SIGINT SIGPIPE SIGTERM SIGIO

#
# Some bash (1 and 2) settings to avoid trouble on a
# failed program call.
#
set +e > /dev/null 2>&1
set +u > /dev/null 2>&1
set +o posix  > /dev/null 2>&1
if type shopt > /dev/null 2>&1 ; then
    shopt -s execfail
else
    no_exit_on_failed_exec=1
fi

#
# Source common code shared between the
# X session and X init scripts
#
. /etc/X11/xinit/xinitrc.common

#
# Special for twm
#
case "$WINDOWMANAGER" in
    *twm) xsetroot -solid darkslateblue
esac

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)

xhost +local:root

PATH=${HOME}/.local/bin:${PATH}
export PATH

# set up i3 config
if [ -d "${HOME}/.config/i3" ]; then
  if [ -d "/sys/module/thinkpad_acpi" ]; then
    ln -s "${HOME}/.config/i3/config-laptop" "${HOME}/.config/i3/config"
  else
    ln -s "${HOME}/.config/i3/config-desktop" "${HOME}/.config/i3/config"
  fi
fi

#
# finally start the window manager
#
unset WINDOW_MANAGER STARTUP
exec $WINDOWMANAGER ${1+"$@"}

# call failsafe
exit 0
