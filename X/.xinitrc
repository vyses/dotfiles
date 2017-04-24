#!/bin/sh

#  source shell scripts

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# load ~/.Xresources
xrdb ~/.Xresources

# set keyboard layout
setxkbmap -model thinkpad -layout ch -option ctrl:swapcaps

# load keyboard bindings
xbindkeys

# thinkpad trackpoint & touchpad
# xinput set-prop "12" "Accel Speed" "0.5"

# xinput set-prop "11" "Device Accel Constant Deceleration" "3"
# xinput set-prop "11" "Device Accel Adaptive Deceleration" "2"

# set DPI (the X260 display has 176dpi, but it is set to 168 dpi for proper scaling of bitmap GUI)
xrandr --dpi 168


# set wallpaper
sh ~/.fehbg &

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

#start redshift
pgrep redshift &> /dev/null || redshift &> /dev/null &

# start x starts WM
exec i3
