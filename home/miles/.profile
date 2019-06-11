#!/usr/bin/env sh
## Copyright © by Miles Bradley Huff from 2016-2018 per the LGPL3 (the Third Lesser GNU Public License)
## Remember:  This file needs to be compatible with POSIX sh!

## By the time this script is executed, the following files have already been
## interpreted, and in this order:
## 1) /etc/environment           (doesn't support variable expansion)
## 2) /etc/security/pam_env.conf (uses pam_env syntax)
## 3) /etc/profile               (this calls all scripts in /etc/profile.d)
##   a) /etc/locale.conf         (localization) (also: /etc/default/locale, /etc/sysconfig/i18n)
##   b) ~/.i18n                  (localization)
## 4) ~/.pam_environment         (uses pam_env syntax)

## Environment variables
[ ! `echo $PATH | grep '\:\.'` ] && export PATH="$HOME/.local/sbin:$HOME/.local/bin:${PATH}:."
export JOBS=`nproc`

## Create new dirs/files with 751/640 perms
umask 066 #5026
