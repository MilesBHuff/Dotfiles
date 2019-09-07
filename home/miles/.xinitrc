#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 201?-2019 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!

## If we're not using a Display Manager, fill in for one.
## =============================================================================
if [ -z $SESSION_MANAGER ]; then

	## Load /etc/xinitrc.d
	## -------------------------------------------------------------------------
	if [ -d '/etc/X11/xinit/xinitrc.d' ]; then
		unalias 'ls'
		for F in "`ls -A /etc/X11/xinit/xinitrc.d`"; do
			[ -x "$F" ] && . "$F"
		done
		unset F
	fi

	## Load misc settings
	## -------------------------------------------------------------------------
	 SYS_RESOURCES='/etc/X11/xinit/.Xresources'
	    SYS_MODMAP='/etc/X11/xinit/.Xmodmap'
	USER_RESOURCES="$HOME/.Xresources"
	   USER_MODMAP="$HOME/.Xmodmap"
	[ -f  "$SYS_RESOURCES" ] && xrdb -merge  "$SYS_RESOURCES"
	[ -f  "$SYS_MODMAP"    ] && xmodmap      "$SYS_MODMAP"
	[ -f "$USER_RESOURCES" ] && xrdb -merge "$USER_RESOURCES"
	[ -f "$USER_MODMAP"    ] && xmodmap     "$USER_MODMAP"
	unset SYS_RESOURCES\
	      SYS_MODMAP   \
	     USER_RESOURCES\
	     USER_MODMAP   \

	## Load xprofiles
	## -------------------------------------------------------------------------
		[ -f /etc/xprofile ] && . /etc/xprofile
		[ -f   ~/.xprofile ] && .   ~/.xprofile

## Init X
## =============================================================================
fi

## Environment variables
## -----------------------------------------------------------------------------
if [ -z $DE ]; then
	DE=xfce
	export DE
fi

## DE/WM/etc to execute
## -----------------------------------------------------------------------------
[ ! -z $1 ] && exec $1
## Change this number to select a target
case 1 in
	0) ## Terminator
		exec terminator -bmf --geometry="`xrandr | grep 'connected' | awk '{print $3}'`"
		;;
	1) ## XFCE
		exec startxfce4
		;;
	2) ## AwesomeWM
		exec awesome -c ~/.config/awesome/rc.lua
		;;
esac
