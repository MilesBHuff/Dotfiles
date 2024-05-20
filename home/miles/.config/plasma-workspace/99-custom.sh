#!/bin/sh

## Ensure that apps know what display server to respect
case "$XGG_SESSION_TYPE" in
    'wayland')
        export GDK_BACKEND=wayland
        export QT_QPA_PLATFORM=wayland
        export MOZ_ENABLE_WAYLAND=1
        ;;
    'x11')
        export GDK_BACKEND=x11
        export QT_QPA_PLATFORM=xcb
        export MOZ_ENABLE_WAYLAND=0
        ;;
    *)
        export MOZ_ENABLE_WAYLAND=0
        ;;
esac

## Misc
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
