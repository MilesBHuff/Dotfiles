#!/usr/bin/env sh
## Copyright (C) by Miles Bradley Huff from 2016-2019 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!

## About
## -----------------------------------------------------------------------------
## By the time this script is executed, the following files have already been interpreted, and in this order:
## 1) /etc/environment           (doesn't support variable expansion)
## 2) /etc/security/pam_env.conf (uses pam_env syntax)
## 3) /etc/profile               (this calls all scripts in /etc/profile.d)
## 4) /etc/locale.conf           (localization) (also: /etc/default/locale, /etc/sysconfig/i18n)
## 5) ~/.i18n                    (localization)
## 6) ~/.pam_environment         (uses pam_env syntax)

## Environment variables
## -----------------------------------------------------------------------------
## Note that this should only be environment variables that require shell capabilities;
## all other user environment variables should go into ~/.pam_environment or ~/.i18n.
[ ! `echo            $PATH | grep ':\.$'` ] &&            PATH="$HOME/.local/bin:${PATH}:."
[ ! `echo $LD_LIBRARY_PATH | grep ':\.$'` ] && LD_LIBRARY_PATH="$HOME/.local/lib:${PATH}:."
JOBS=`nproc`
TEMP="/tmp"
WATCHFMT="%n from %M has %a tty%l at %T %W"
export         PATH \
    LD_LIBRARY_PATH \
    JOBS            \
    TEMP            \
    WATCHFMT        \

## Additional settings
## -----------------------------------------------------------------------------
## Create new dirs/files with 751/640 perms
umask 066 #5026
