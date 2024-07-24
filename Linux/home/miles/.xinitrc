#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 201?-2024 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!
##
## Controls the behavior of `startx`.

## Helpers
source() { [ -x "$1" ] && . "$1"; }
SOURCED_XINITRC=1 ## Used by `~/.xprofile`

## If we're not using a Display Manager, do what display managers do that `xinitrc` does not.
if [ -z "$SESSION_MANAGER" ]; then
	echo 'WARNING: `$SESSION_MANAGER` is unset – you might not be using a Display Manager!' >&2
	source "$HOME/.xprofile"
fi

## Source the system `xinitrc` instead of reinventing the wheel.
source '/etc/X11/xinit/xinitrc' ## Should load `~/.Xresources`, `~/.xsessionrc` (Debian-based only), and `~/.xsession`.
