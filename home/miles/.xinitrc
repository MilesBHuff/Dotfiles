#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 201?-2024 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!
##
## Controls the behavior of `startx`.

## If we're not using a Display Manager, do some things to maximize sanity.
if [ -z "$SESSION_MANAGER" ]; then
	## Display Managers have their own scripts that import a lot of important configuration from the system.
	## If we're running without one, we need to warn the user and then attempt to do some of that important work ourselves.
	echo 'WARNING: `$SESSION_MANAGER` is unset!' >&2
	. "$HOME/.xprofile"
fi

## Start the session
FILE="$HOME/.xsession"
[ -x "$FILE" ] && . "$FILE"
unset FILE