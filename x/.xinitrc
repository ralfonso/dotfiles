xrandr --dpi 144
xrbd -merge ~/.Xresources
/usr/bin/unity-settings-daemon &

/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh &

nitrogen --restore

# notifications daemon
dunst &

# Pulseaudio tray icon/chooser
pasystray &

# Make caps another ctrl
setxkbmap -layout us -option ctrl:nocaps

# Make right alt/win compose
setxkbmap -option compose:rwin

# Increase keyboard repeat
xset r rate 220 43

# Turn off the monitor after ten minutes idle
xset dpms 0 0 600

# Then disable it since we let i3lock turn this on
xset -dpms

# Compositor
compton -f -b -D 2

## Start nm-applet for systray
nm-applet &

## Start Thunar Daemon
thunar --daemon &

## Start xscreensaver
# xscreensaver -no-splash &

type razercfg >/dev/null 2>&1 && razercfg -l all:off

## Start Clipboard manager
(sleep 3s && clipit) &

emojione-picker &

# flux
fluxgui &

slack &
google-chrome &
sakura &
