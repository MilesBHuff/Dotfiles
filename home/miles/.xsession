#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 2018-2019 per the LGPL3 (the Third Lesser GNU Public License)

## Daemons
xfsettingsd &
start-pulseaudio-x11 &
light-locker &
gpg-agent --daemon &

## Applets
nm-applet &
blueman-applet &
pasystray &
system-config-printer-applet &
qjoypad &
redshift-gtk &

## Apps
#franz &
#discord &
