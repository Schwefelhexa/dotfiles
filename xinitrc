#!/bin/sh

# merge in defaults and keymaps
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

picom &
feh --bg-fill ~/.files/Wallpapers/catppuccin.png

setxkbmap eu

xrandr --dpi 96 \
  --output DP-0 --mode 3440x1440 --rate 165 --pos 0x600 --primary \
  --output HDMI-0 --mode 1920x1080 --rate 60 --pos 3440x1080 \
  --output DP-2 --mode 1920x1080 --rate 60 --pos 3440x0

# start window manager
exec $1

