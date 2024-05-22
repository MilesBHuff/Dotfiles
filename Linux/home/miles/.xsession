#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 2017-2020 per the LGPL3 (the Third Lesser GNU Public License)

## Start a DE/WM/etc
[ -n "$1" ] && [ -x "$1" ] && exec "$1" ## If a valid command was passed, execute it as the DE/WM/etc
case 0 in ## Change this number to select a target

	0) ## Do nothing
		;;

	1) ## Terminator
		exec terminator -bmf --geometry=$(xrandr | grep 'connected' | awk '{print $3}')
		;;

	2) ## XFCE
		exec startxfce4
		;;

	3) ## AwesomeWM
		export USE_XSESSION=true ## Custom variable used to control whether the contents of `~/.xsession` are executed.
		[ -z $DE ] && export DE=xfce
		exec awesome -c ~/.config/awesome/rc.lua
		;;

	4) ## KDE
		exec startplasma-x11
		;;
esac
