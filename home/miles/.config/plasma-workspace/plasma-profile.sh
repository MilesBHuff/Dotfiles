#!/bin/sh
## Copyright (C) by Miles Bradley Huff from 2024 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!

## Import display profile.
FILE="${HOME}/.dprofile" && [ -f "$FILE" ] && . "$FILE"

## Attempt to make GTK apps use the KDE file dialog.
export GTK_USE_PORTAL=1

## Misc
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
