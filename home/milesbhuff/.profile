#!/usr/bin/env sh
## Remember:  This file needs to be compatible with POSIX sh!

## Settings
## =============================================================================
## Import environment
if [ -f .pam_environment ]; then
	while read L; do
		export "$L"
	done < .pam_environment
fi
## Configure the PATH
[ "$PATH" != *'.'* ] && export PATH="$HOME/.local/bin:$HOME/.local/sbin:$PATH:."
## Create new dirs/files with 755/644 perms
umask 022

## Background programs
## =============================================================================
## Start gpg-agent
[ ! -z `which 'gpg-agent'` ] && [ `which 'gpg-agent'` != *'not found'* ] && gpg-agent --daemon > /dev/null

