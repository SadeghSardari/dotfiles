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

# keyboard rate
xset r rate 400 35

# keyboard layout
# see https://wiki.archlinux.org/index.php/X_keyboard_extension
# and /usr/share/X11/xkb/rules/*.lst for more options
setxkbmap -model thinkpad -layout us -option ctrl:nocaps

# start redshift
pgrep redshift -l 39.47:119.79 -t 4500K:3500K &> /dev/null || redshift -l 39.47:119.79 -t 4500K:3500K &> /dev/null &

# load keyboard bindings
xbindkeys

# start dropbox
/usr/bin/dropbox &

# set background image
feh --bg-scale ~/Dropbox/Images/transcriber_vs_bg.jpg

# for GTK3 HiDPI
export GDK_SCALE=2

exec dwm 2> ~/tmp/dwm.log

