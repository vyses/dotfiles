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

# set DPI (X260 screen: 1920x1080/277x156mm/176x176dpi. 290x163mm would result in dpi 168 for proper scaling of bitmap GUI based on dpi 96)
xrandr --fbmm 277x156


# set wallpaper
sh ~/.fehbg &

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

#start redshift
pgrep redshift &> /dev/null || redshift &> /dev/null &

# start x starts WM
exec i3
