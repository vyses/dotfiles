#!/bin/sh


# Take a screenshot
scrot /tmp/screen_locked.png

# Pixellate it 10x
mogrify -scale 10% -scale 1000% /tmp/screen_locked.png

# Lock screen displaying this image without unlock indicator
i3lock -u -i /tmp/screen_locked.png
