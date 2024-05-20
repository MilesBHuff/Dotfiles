#!/bin/sh
## Copyright (C) by Miles Bradley Huff from 2024 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!

## Ensure that apps know what display server to respect
case "$XGG_SESSION_TYPE" in
    'wayland') export \
        GDK_BACKEND=wayland \
        QT_QPA_PLATFORM=wayland \
        MOZ_ENABLE_WAYLAND=1 \
        ;;
    'x11')
        ## Do nothing; already set in `~/.xprofile`.
        ;;
    *)
        ## Do nothing; unsupported.
        ;;
esac

## Makes some GTK apps use the KDE file dialog.
export GTK_USE_PORTAL=1

## Misc
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
