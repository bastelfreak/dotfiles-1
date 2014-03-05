#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# German key layout ( In case you are not german: remove the following line)
setxkbmap -layout de 

#You can use this section as autostart for example:
# wicd-curse &

# Conky as statusbar
conky -c ~/.conkyrc | while read -r; do xsetroot -name "$REPLY"; done &
# Urxvtd in daemon-mode ( FUCK YEAH :D )
urxvtd -f
# Loads the config for the urxvt
xrdb -load .Xresources
# Executing dwm
exec dwm
# In case you have a Notebook uncomment the following lines
# For emulating a "mouse-wheel-click".. useful for copy-pasting in the urxvt
#synclient TapButton2=2
#synclient EmulateTwoFingerMinZ=1


