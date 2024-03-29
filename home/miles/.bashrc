#!/usr/bin/env bash
## Copyright © by Miles Bradley Huff from 2016-2017 per the LGPL3 (the Third Lesser GNU Public License)

## PRELIMINARY
[[ $- != *i* ]] && return  ## If not running interactively, don't do anything

## VARIABLES
PS1='\n\e[36m\u\e[0m@\e[33m\H\e[0m:\e[34m\w\e[0m/ \e[35m\n\$\e[0m '

## FUNCTIONS & ALIASES
source "$HOME/.aliasrc"

## COMPLETION
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

## OPTIONS
shopt -s                \
	autocd              \
	cdable_vars         \
	checkhash           \
	checkwinsize        \
	cmdhist             \
	expand_aliases      \
	extglob             \
	extquote            \
	force_fignore       \
	globstar            \
	gnu_errfmt          \
	histappend          \
	histreedit          \
	histverify          \
	hostcomplete        \
	interactive_comments\
	nullglob            \
	progcomp            \
	promptvars          \
	sourcepath          \
	xpg_echo
shopt -u                   \
	cdspell                \
	checkjobs              \
	dirspell               \
	dotglob                \
	execfail               \
	extdebug               \
	failglob               \
	huponexit              \
	lithist                \
	mailwarn               \
	no_empty_cmd_completion\
	nocaseglob             \
	shift_verbose
set -o ignoreeof

## FINALIZATION
clear && echo
#if [[ "$(pwd)" == "$HOME" ]]; then
#	## If the user has another home directory in the same directory with a name
#	## equivalent to the user's username, except that at least the first letter
#	## is capitalized;  then cd that directory to avoid ls spam.
#	CAPS_USERNAME="$(tr '[:lower:]' '[:upper:]' <<< ${NORMAL_USERNAME:0:1})${NORMAL_USERNAME:1}"  ## Thanks, http://stackoverflow.com/a/12487465.
#	if [[ -d "$HOME/../$CAPS_USERNAME" ]]; then
#		cd "$HOME/../$CAPS_USERNAME"
#	else
#		ls
#	fi
#else
#	ls
#fi
