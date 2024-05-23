#!/usr/bin/env bash
## Copyright (C) by Miles Bradley Huff from 2016-2024 per the LGPL3 (the Third Lesser GNU Public License)

################################################################################
## PRELIMINARY

[[ $- != *i* ]] && return  ## If not running interactively, don't do anything

################################################################################
## FUNCTIONS

function _import { [[ -r "$1" ]] && source "$1"; }
_import "$HOME/.functionrc"

################################################################################
## PROMPT

function _prompt_command {
	local -i EXIT_CODE="$?"
	PS1='' ## Reset default prompt
	#NOTE: Color codes have to wrapped in escaped brackets or they will mess up line spacing.

	# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	## Zeroeth line
	PS1+='\[\e[0m\]' ## Sets the prompt to white, just in case.
	if [[ ! $EXIT_CODE -eq 0 ]]; then
		PS1+='∴ ' ## Label
		PS1+='\[\e[31m\]$?' ## Exit code of last command, red
		PS1+='\[\e[0m\] ' ## Trailing space, white; just in-case
	fi
	PS1+='\n' ## Newline between output of last command and prompt

	# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	## First line - matches the format of an auth'ed URL

	# local IS_NORM_USER=
	# [[ $(whoami)   == "$NORMAL_USERNAME" ]] && IS_NORM_USER=1
	# local IS_NORM_HOST=
	# [[ $(hostname) == "$NORMAL_HOSTNAME" ]] && IS_NORM_HOST=1

	PS1+='\[\e[1;32m\]\u' ## Username, bold green; to match dircolors
	PS1+='\[\e[0m\]@' ## @-sign, white
	PS1+='\[\e[1;35m\]\H' ## Hostname, bold magenta; to match dircolors
	PS1+='\[\e[0m\]:' ## Colon, white

	## Path: If root, print a slash; else, `ls`.
	if [[ "$PWD" != '/' ]]; then
		PS1+=$(_ls -d $(pwd)) ## Path; matches dircolors
	else
		PS1+='\[\e[0m\]/' ## Trailing slash, white; matches vibe of `ls -F` better than it itself does
	fi
	PS1+=' ' ## Trailing space before commands; makes the second line optional.

	# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	## Optional suffix to first line: version control information

	function vcs-detect {
		git rev-parse --is-inside-work-tree >/dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			echo 'git'
			return
		fi
	}
	local VCS=$(vcs-detect)
	if [[ ! -z "$VCS" ]]; then

		function vcs-get-branch {
			case "$VCS" in
				'git') git branch --no-color 2>/dev/null | grep --color=never '\*' 2>/dev/null | sed 's/\* //' 2>/dev/null ;;
			esac
		}
		local VCS_BRANCH=$(vcs-get-branch)

		function vcs-get-dirty {
			case "$VCS" in
				'git') git diff-index --quiet HEAD -- >/dev/null 2>&1; return $? ;;
			esac
		}
		local VCS_DIRTY=$(vcs-get-dirty; echo "$?")

		PS1+='\[\e[2m\](' ## Opening parenthesis, faint
		if [[ ! -z "$VCS_BRANCH" ]]; then
			PS1+='\[\e[36m\]'"$VCS_BRANCH" ## VCS branch, cyan
		fi; if [[ "$VCS_DIRTY" -eq 1 ]]; then
			PS1+='\[\e[0m\]*' ## Asterisk for dirty repos, white
		fi
		PS1+='\[\e[2m\])' ## Closing parenthesis, faint
		PS1+='\[\e[0m\] ' ## Trailing space before commands; makes the second line optional.
	fi

	# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	## Second line
	PS1+='\n'
	if [[ $EUID -eq 0 ]]; then
		PS1+='\[\e[1;31m\]' ## Root user, bold red
	else
		PS1+='\[\e[1;33m\]' ## Normal user, bold yellow; to match dircolors
	fi
	PS1+='\$' ## Whether elevated
	PS1+='\[\e[0m\] ' ## Trailing space, white; before commands
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
PROMPT_COMMAND='_prompt_command'
PS2='\[\e[37m\]> \[\e[0m\]'

################################################################################
## HOME PRETTIFICATION

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

################################################################################
## FUNCTIONS, ALIASES, ETC

_import '/usr/share/bash-completion/bash_completion'
_import "$HOME/.aliasrc"

################################################################################
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
	xpg_echo            \

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
	shift_verbose          \

set -o ignoreeof

################################################################################
## FINALIZATION

# clear
# echo
