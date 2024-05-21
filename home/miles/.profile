#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 2016-2024 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!
##
## This file contains environment variables and settings that are relevant only for shell use.

## Environment variables
## =============================================================================

## Preferred Applications
## -----------------------------------------------------------------------------

## Pager
export MANPAGER=less
export PAGER=less

## Editor
export EDITOR=nano
export VISUAL=nano

## Other
export BROWSER=elinks
#export SHELL=/usr/bin/zsh

## Terminal Settings
## -----------------------------------------------------------------------------

## Colors
export USE_COLOR=true
export GREP_COLORS=*=0:sl=0:cx=0:mt=7;1:ms=7;1:mc=7;1:fn=94:ln=95:bn=91:se=0
## Generate by running `.dir_colors`:
export LS_COLORS=*=0:rs=0:no=0:fi=0:su=40:sg=40:ca=4:ex=1:di=34:ow=34;40:tw=4;34;40:st=4;34:mh=4:ln=36:or=31:mi=1;31:do=4;33:so=1;33:pi=33:cd=1;35:bd=35:*.swap=1;33:*.swp=1;33:*.tmp=33:*.iso=35:*.tar=35:*.cab=35:*.7z=1;35:*.bz=1;35:*.bz2=1;35:*.gz=1;35:*.lrz=1;35:*.lz=1;35:*.lz4=1;35:*.lzh=1;35:*.lzma=1;35:*.lzo=1;35:*.rz=1;35:*.rar=1;35:*.t7z=1;35:*.taz=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tlz=1;35:*.txz=1;35:*.tz=1;35:*.tzo=1;35:*.tzst=1;35:*.war=1;35:*.wim=1;35:*.xz=1;35:*.z=1;35:*.zip=1;35:*.zst=1;35:*.ace=1;35:*.alz=1;35:*.arc=1;35:*.arj=1;35:*.cpio=1;35:*.deb=1;35:*.dwm=1;35:*.dz=1;35:*.ear=1;35:*.esd=1;35:*.lha=1;35:*.jar=1;35:*.rpm=1;35:*.sar=1;35:*.swm=1;35:*.zoo=1;35

## History
#export HISTFILE="{HOME}/.sh_history"
#export HISTFILESIZE=2048
#export HISTSIZE=2048
#export SAVEHIST=2048
#export DIRSTACKFILE="{HOME}/.cache/dirstack"
#export DIRSTACKSIZE=12

## Miscellaneous
## -----------------------------------------------------------------------------

## Deprecated; must be unset to avoid warnings
export GREP_OPTIONS=

## Custom environment variables
# export NORMAL_HOSTNAME=localhost
# export NORMAL_USERNAME=user

## Other
export WATCHFMT="%n from %M has %a tty%l at %T %W"

## Stuff that belongs somewhere like `~/.config/environment.d/envvars.conf`, but due to technical limitations can't be put there
## -----------------------------------------------------------------------------
export JOBS=$(nproc)

## Core
export PATH="${PATH}:${HOME}/.cargo/bin"
export LD_LIBRARY_PATH=/usr/lib64:/usr/lib:/usr/local/lib64:/usr/local/lib

## Periphery
# export ANDROID_HOME=/opt/android-sdk
export PROJECTDIR="${HOME}/Development"

## Wine
# export WINEPREFIX="{HOME}/.PlayOnLinux/wineprefix/wine64"

## Other
# export TEMP="/tmp/${USER}"

## Non-variable environment settings
## =============================================================================
## Create new dirs/files with 751/640 perms
umask 066 #5026
