exec > ~/tmp/startx.log 2>&1

# X.org Resize and Rotate: libglvnd support for mesa
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 210/LVDS

# suckless status monitor
slstatus &

# set font directory
xset +fp /usr/share/fonts/misc &
xset fp rehash &

# keyboard layout
# see https://wiki.archlinux.org/index.php/X_keyboard_extension
# see /usr/share/X11/xkb/rules/*.lst for more options
setxkbmap -model thinkpad -layout us -option ctrl:nocaps

# start redshift
pgrep redshift &> /dev/null || redshift &> /dev/null &

xbindkeys

exec dwm 2> ~/tmp/dwm.log
