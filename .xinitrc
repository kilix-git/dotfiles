#!/usr/bin/env bash
export XIM=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export XIM_PROGRAM="ibus-daemon"
export XIM_ARGS="--daemonize --xim"

ibus-daemon --daemonize --xim
# always start numlock, we need a numlockx package thou
if [ -x /usr/local/bin/numlockx ]; then
     /usr/local/bin/numlockx on > /dev/null 2>&1 &
fi

# this is useful
if [ -f /home/matej/.Xresources ]; then
	xrdb -merge ~/.Xresources
fi

# xrandr for two monitors, VGA-1 is to the right of HDMI-1 and rotated 90°
xrandr --output HDMI-1 --auto --rotate normal --pos 0x0 --output VGA-1 --auto --rotate left --right-of HDMI-1

# feh is used to set desktop background pic
feh --bg-max -z ~/docs/pict/wpprs/*

# redshift to keep my eyes healthy
sleep 1 ; redshift -l 58:18 -t 6000:3000 -g 0.8 -m randr &

# picom is for those neat desktop effects
picom -c -f -i 0.8 &

# ibus-daemon is for keyboard switching
#ibus-daemon --daemonize --xim

# window manager of choice is spectrwm of course
exec spectrwm
#exec start-lumina-desktop
