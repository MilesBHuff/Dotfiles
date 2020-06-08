#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 201?-2019 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!

## If we're not using a Display Manager, print a warning message.
## =============================================================================
[ -z $SESSION_MANAGER ] && echo 'WARNING: $SESSION_MANAGER is unset!' >&2
## Display Managers have their own scripts that import a lot of important configuration from the system.

## Start a DE
## =============================================================================

## Environment variables
## -----------------------------------------------------------------------------
USE_XSESSION=true
if [ -z $DE ]; then
	DE=xfce
	export DE
fi

## DE/WM/etc to execute
## -----------------------------------------------------------------------------
[ ! -z $1 ] && exec $1
## Change this number to select a target
case 2 in
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
