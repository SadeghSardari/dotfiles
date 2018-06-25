exec > ~/tmp/startx.log 2>&1

# X.org Resize and Rotate
xrandr --auto

# suckless status monitor
slstatus &

# set font directory
xset +fp /usr/share/fonts/misc &
xset fp rehash &

# keyboard layout
# see https://wiki.archlinux.org/index.php/X_keyboard_extension
# see /usr/share/X11/xkb/rules/*.lst for more options
setxkbmap -model thinkpad -layout us -option ctrl:nocaps

xbindkeys

exec dwm 2> ~/tmp/dwm.log
