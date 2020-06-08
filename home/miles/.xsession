#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 2018-2020 per the LGPL3 (the Third Lesser GNU Public License)
if [[ $USE_XSESSION ]]; then

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
	xfce4-power-manager &
	qjoypad &
	redshift-gtk &

	## Apps
	~/.local/bin/start-minimized.py 'franz' 'Franz' &
	~/.local/bin/start-closed.py 'discord' 'Activity - Discord' &
	steam %U -silent &

fi
