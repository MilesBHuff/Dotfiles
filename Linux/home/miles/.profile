#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 2016-2024 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!
##
## This file contains environment variables and settings that are relevant only for shell use.

## Preferred Applications
## -----------------------------------------------------------------------------

## Pager
export PAGER='less'
export MANPAGER="$PAGER"

## Editor
export EDITOR='nano'
export VISUAL='nano'

## Other
export BROWSER='elinks'
#export SHELL='/usr/bin/zsh'

## Terminal Settings
## -----------------------------------------------------------------------------

## Colors
export USE_COLOR='true'
export GREP_COLORS='*=0:sl=0:cx=0:mt=7;1:ms=7;1:mc=7;1:fn=94:ln=95:bn=91:se=0'
## Generate by running `.dir_colors`:
export LS_COLORS=$("$HOME/.dir_colors" | sed -n "s/.*'\(.*\)'.*/\1/p")

## History
export HISTFILE="${HOME}/.history"
export HISTSIZE=9999
export HISTFILESIZE=9999
export SAVEHIST=${HISTFILESIZE}
export DIRSTACKFILE="${HOME}/.cache/dirstack"
export DIRSTACKSIZE=99

## Miscellaneous
## -----------------------------------------------------------------------------

## Deprecated; must be unset to avoid warnings
export GREP_OPTIONS=

## Custom environment variables
# export NORMAL_HOSTNAME=localhost
# export NORMAL_USERNAME=user

## Other
export WATCHFMT='%n from %M has %a tty%l at %T %W'

## Stuff that belongs somewhere like `~/.config/environment.d/envvars.conf`, but due to technical limitations can't be put there
## -----------------------------------------------------------------------------
export JOBS=$(nproc)

## Core
export PATH="${PATH}:${HOME}/.cargo/bin"
export LD_LIBRARY_PATH='/usr/lib64:/usr/lib:/usr/local/lib64:/usr/local/lib'

## Periphery
# export ANDROID_HOME='/opt/android-sdk'
export PROJECTDIR="${HOME}/Development"

## Wine
# export WINEPREFIX="{HOME}/.PlayOnLinux/wineprefix/wine64"

## Other
# export TEMP="/tmp/${USER}"

## Create new dirs/files with 751/640 perms
umask 026 #5026
