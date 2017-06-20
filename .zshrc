#!/usr/bin/env zsh


#### COPYRIGHT -----------------------------------------------------------------
## Written from scratch by Miles Bradley Huff
## The few parts from help-sites and such that I didn't actually write myself
## are sourced inline via comment.
##
## Copyright (c) 2016-2017 under the Third Lesser GNU Public License (LGPL3)
## ^^ This, naturally, does not apply to lines that I did not write.


#### TABLE OF CONTENTS ---------------------------------------------------------
## Copyright
## Table of contents
## Style-guide
## Initialization      #TODO
## Early plugins
## Keybinds
## Completion          #TODO
## Late plugins
## Session-variables   #TODO
## Options
## Functions & aliases
## Finalization


#### STYLE-GUIDE ---------------------------------------------------------------
## The number of hashtags indicates the type of comment.
## Lv4 :  #### TITLE (THESE CAPITALIZE EVERY LETTER AND HAVE DASHES EXTENDING TO
##                    THE 80-CHAR LIMIT) ---------------------------------------
## Lv3 :  ### Section (These Capitalize Every Word)
## Lv2a:  ## Comment (These use sentence-case.)
## Lv2b:  #EXAMPLE:  Another type of Lv2 comment uses a keyword after a single
##                   hashtag.  If desired, a comment may follow;  but this
##                   comment must be preceded by ':  '.
## Lv1 :  # echo "A single hashtag is used for to comment-out code."
##
## Lv4 comments have two lines before them
## Lv3 comments have one line before them, unless the line immediately above
##     is a Lv4 comment.
## Lv2* & Lv1 comments have no lines before them
##
## Except for Lv2b comments, a space must go in-between the hashtag(s) and the
## comment.
##
## The ordering between, but not within, blocks headed by Lv4 and Lv3 comments
## is important.
## The ordering between blocks headed by Lv2* and Lv1 comments is unimportant.
##
## Unless otherwise specified (via Lv2b comment), the ordering within a block,
## regardless of level, is unimportant.
## The ordering of unimportant elements should be done alphabetically,
## unless there is reason to do otherwise.
##
## Where possible, lines should not be longer than 80 characters.
## Lines should not end with blank space.
## There should be exactly one blank line at the end of this file.


#### INITIALIZATION ------------------------------------------------------------
### Switches
LOAD_BAR=false  ## Useful for finding bottlenecks.
PLUGINS=false   ## Useful when Antigen's broken.

### Loading-bar
[[ $LOAD_BAR == true ]] && echo '_________________'

### Preparation
#NOTE:  Order important!
#[[ -f "/etc/profile" ]] && source "/etc/profile"
emulate zsh
umask 022
[[ $LOAD_BAR == true ]] && echo -n '█'

### Load Environment
#NOTE:  Order important!
setopt all_export
	[[ -f "/etc/locale.conf" ]] && source "/etc/locale.conf"
	[[ -f "/etc/environment" ]] && source "/etc/environment"
	[[ -f "$HOME/.pam_environment" ]] && source "$HOME/.pam_environment"
unsetopt all_export
[[ $LOAD_BAR == true ]] && echo -n '█'

### Autoloads
#TODO
autoload -Uz chpwd_recent_dirs\
             zkbd             \
             zmv
[[ $LOAD_BAR == true ]] && echo -n '█'

### Zmodloads
#TODO
#zmodload zsh/terminfo
[[ $LOAD_BAR == true ]] && echo -n '█'

### Load Plugin-Manager
#NOTE:  Order important!
if [[ $PLUGINS == true ]]; then
	source /usr/share/zsh/scripts/antigen/antigen.zsh
	antigen-use oh-my-zsh
fi
[[ $LOAD_BAR == true ]] && echo -n '█'

### Prompt
## Yes, this needs to be its own section.  This is because, though my prompt be
## rather simple;  there be many a complex manner of configuring one's prompt in
## zsh, and I wished to support these such manners fairly explicitly.
setopt all_export
	PROMPT="
$([[ ! "$(hostname)" == "$NORMAL_HOSTNAME" ]] || [[ ! "$(whoami)" == "$NORMAL_USERNAME" ]] && echo $([[ ! "$(whoami)" == "$NORMAL_USERNAME" ]] && echo '%F{6}%n%f@')'%F{3}%M%f:')%F{4}%~%f%E/
%F{5}%#%f " #TODO:  Would be nice to add support for version-control software.
	PS1="$PROMPT"
	PS2="  "
	RPROMPT=""
	POSTEDIT=""  ## Might be worth putting a blank line here.
unsetopt all_export
[[ $LOAD_BAR == true ]] && echo -n '█'

### Inits
#NOTE:  Order important!
#colors
#compinit
[[ $LOAD_BAR == true ]] && echo -n '█'


#### EARLY PLUGINS -------------------------------------------------------------
## Order wasn't important here, so I did them alphabetically, with Oh-My-ZSH
## plugins first, since Oh-My-ZSH is Antigen's default repo.
if [[ $PLUGINS == true ]]; then
	source /usr/share/doc/pkgfile/command-not-found.zsh
	antigen-bundle colemak                    #NOTE:  Remove this line if you don't use the Colemak layout.
	antigen-bundle extract
	#antigen-bundle zsh_reload                #NOTE:  Doesn't quite work right.
	antigen-bundle Tarrasch/zsh-autoenv
	antigen-bundle zsh-users/zsh-completions
fi
[[ $LOAD_BAR == true ]] && echo -n '█'


#### KEYBINDS ------------------------------------------------------------------
### Set up the keymap
## Load a saved keymap...
if [[ -f "${ZDOTDIR:-$HOME}"/.zkbd/"$TERM-$VENDOR-$OSTYPE" ]]; then  ## I got this line from the manpage.
	source "${ZDOTDIR:-$HOME}"/.zkbd/"$TERM-$VENDOR-$OSTYPE"
	[[ -f "${ZDOTDIR:-$HOME}"/.zkbd/*.tmp ]] && rm -f "${ZDOTDIR:-$HOME}"/.zkbd/*.tmp
## ...Or generate a new one.
else
	echo "Note that if you've already completed this step, your settings might not"
	echo "have been saved with the right filename.  Make sure the file pertaining"
	echo "to your current setup is named \"$TERM-$VENDOR-$OSTYPE\".  You can find"
	echo "your current ZSh keyboard-settings in \"$ZDOTDIR/.zkbd/\"."
	zkbd
fi
## Declare modifier-keys
function ctrl {
	S='1;5'
	for I in {0..9}; do
		[[ $1 == *$I* ]] && S=';5'
	done
	echo "$(echo $1 | sed 's/[^\^^\[^0-9]//g')$S$(echo $1 | sed 's/[\^\[0-9]//g')"
}
[[ $LOAD_BAR == true ]] && echo -n '█'

### Widget-declaration
## You can use zle to create a widget doing any command.

### General binding
## Special keys
[[ -n ${key[Backspace]} ]] && bindkey        "${key[Backspace]}"  'backward-delete-char'
[[ -n ${key[Delete]}    ]] && bindkey        "${key[Delete]}"     'delete-char'
[[ -n ${key[Down]}      ]] && bindkey        "${key[Down]}"       'history-search-forward'
[[ -n ${key[End]}       ]] && bindkey        "${key[End]}"        'end-of-line'
[[ -n ${key[F1]}        ]] && bindkey        "${key[F1]}"         'run-help'
[[ -n ${key[Home]}      ]] && bindkey        "${key[Home]}"       'beginning-of-line'
[[ -n ${key[Insert]}    ]] && bindkey        "${key[Insert]}"     'overwrite-mode'
[[ -n ${key[Left]}      ]] && bindkey        "${key[Left]}"       'backward-char'
[[ -n ${key[PageDown]}  ]] && bindkey        "${key[PageDown]}"   'end-of-buffer-or-history'
[[ -n ${key[PageUp]}    ]] && bindkey        "${key[PageUp]}"     'beginning-of-buffer-or-history'
[[ -n ${key[Right]}     ]] && bindkey        "${key[Right]}"      'forward-char'
[[ -n ${key[Up]}        ]] && bindkey        "${key[Up]}"         'history-search-backward'
## Modified special keys
[[ -n ${key[Backspace]} ]] && bindkey "$(ctrl ${key[Backspace]})" 'backward-kill-word'  ## Actually impossible to get to work.  :\
[[ -n ${key[Delete]}    ]] && bindkey "$(ctrl ${key[Delete]})"    'kill-word'
[[ -n ${key[Down]}      ]] && bindkey "$(ctrl ${key[Down]})"      'down-line-or-history'
[[ -n ${key[Left]}      ]] && bindkey "$(ctrl ${key[Left]})"      'backward-word'
[[ -n ${key[Right]}     ]] && bindkey "$(ctrl ${key[Right]})"     'forward-word'
[[ -n ${key[Up]}        ]] && bindkey "$(ctrl ${key[Up]})"        'up-line-or-history'
## Normal keys
                              bindkey "^o"                        'quote-line'
                              bindkey "^a"                        'get-line'
                              bindkey "^x"                        'push-line'
                              bindkey "^y"                        'redo'
                              bindkey "^z"                        'undo'  ## Impossible to get Ctrl+Shift+Z to be backspace.  :(
[[ $LOAD_BAR == true ]] && echo -n '█'

### Plugin-dependent binding
if [[ $PLUGINS == true ]]; then
	[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" 'history-substring-search-down'
	[[ -n ${key[Up]}   ]] && bindkey "${key[Up]}"   'history-substring-search-up'
fi
[[ $LOAD_BAR == true ]] && echo -n '█'


#### COMPLETION ----------------------------------------------------------------
#TODO
## From the Arch Linux Wiki:
zstyle ':chpwd:*'      recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/chpwd-recent-dirs"
zstyle ':completion:*' rehash           true
[[ $LOAD_BAR == true ]] && echo -n '█'


#### LATE PLUGINS --------------------------------------------------------------
#NOTE:  Order important!
if [[ $PLUGINS == true ]]; then
	antigen-bundle zsh-users/zsh-syntax-highlighting
	antigen-bundle zsh-users/zsh-history-substring-search
fi
[[ $LOAD_BAR == true ]] && echo -n '█'


#### SESSION-VARIABLES ---------------------------------------------------------
setopt all_export
	#TODO
unsetopt all_export
[[ $LOAD_BAR == true ]] && echo -n '█'


#### OPTIONS -------------------------------------------------------------------
## Although it's possible to format this in many ways, I'm doing it as follows:
## o  All lowercase
## o  Underscores between words
## o  'no_' instead of 'unsetopt'
#NOTE:  The order between Lv3 blocks here doesn't matter.  The order used
##      for them is the same as used in their manpage.
## See the man page for zshoptions(1) for more an explanation of what the things
## in this section's subsections do.

### Changing Directories
setopt               \
    auto_cd          \
    auto_pushd       \
    cdable_vars      \
 no_chase_dots       \
 no_chase_links      \
 no_posix_cd         \
    pushd_ignore_dups\
    pushd_minus      \
    pushd_silent     \
    pushd_to_home

### Completion
## You should probably disable menu_complete if you aren't using ie Oh-My-Zsh.
setopt                \
    always_last_prompt\
    always_to_end     \
    auto_list         \
    auto_menu         \
    auto_name_dirs    \
    auto_param_keys   \
    auto_param_slash  \
 no_auto_remove_slash \
 no_bash_auto_list    \
 no_complete_aliases  \
 no_complete_in_word  \
    glob_complete     \
    hash_list_all     \
    list_ambiguous    \
 no_list_beep         \
    list_packed       \
 no_list_rows_first   \
    list_types        \
    menu_complete     \
 no_rec_exact

### Expansion And Globbing
## Glob Modes:
##   0. Compliance
##   1. Normal
##   2. Uber
export GLOB_MODE=1
#NOTE:  glob_subst can break history-scrolling
setopt                \
    glob              \
 no_glob_subst        \
    mark_dirs         \
    numeric_glob_sort
case $GLOB_MODE in
	0|1) ## Simple modes
		setopt                \
		    bad_pattern       \
		 no_bare_glob_qual    \
		 no_equals            \
		 no_extended_glob     \
		 no_hist_subst_pattern\
		    brace_expand      \
		 no_ksh_glob          \
		 no_magic_equal_subst \
		    nomatch           \
		 no_null_glob         \
		 no_rematch_pcre
		case $GLOB_MODE in
			0) ## Compliance mode
			    setopt                 \
			     no_brace_ccl          \
			        case_glob          \
			        case_match         \
			     no_csh_null_glob      \
			        glob_assign        \
			        ignore_close_braces\
			     no_multibyte          \
			     no_rc_expand_param    \
			        sh_glob            \
			     no_unset              \
			        warn_create_global
			    ;;
			1) ## Normal mode
			    setopt                 \
			        brace_ccl          \
			     no_case_glob          \
			     no_case_match         \
			        csh_null_glob      \
			     no_glob_assign        \
			        rc_expand_param    \
			     no_sh_glob            \
			        unset              \
			     no_warn_create_global
			    ;;
		esac
		;;
	2) ## Uber mode
		setopt                 \
		 no_bad_pattern        \
		    bare_glob_qual     \
		    brace_ccl          \
		    case_glob          \
		    case_match         \
		    csh_null_glob      \
		    equals             \
		    extended_glob      \
		 no_glob_assign        \
		    glob_star_short    \
		    hist_subst_pattern \
		    brace_expand       \
		 no_ignore_close_braces\
		    ksh_glob           \
		    magic_equal_subst  \
		 no_nomatch            \
		    null_glob          \
		    rc_expand_param    \
		    rematch_pcre       \
		 no_sh_glob            \
		    unset              \
		 no_warn_create_global
		;;
esac
unset GLOB_MODE

### History
setopt                     \
    hist_append            \
 no_hist_expand            \
 no_extended_history       \
 no_hist_allow_clobber     \
 no_hist_beep              \
    hist_expire_dups_first \
    hist_fcntl_lock        \
    hist_find_no_dups      \
 no_hist_ignore_all_dups   \
    hist_ignore_dups       \
 no_hist_ignore_space      \
    hist_lex_words         \
    hist_no_functions      \
 no_hist_no_store          \
    hist_reduce_blanks     \
    hist_save_by_copy      \
 no_hist_save_no_dups      \
    hist_verify            \
 no_inc_append_history     \
 no_share_history

### Initialization
setopt           \
 no_all_export   \
    global_export\
 no_global_rcs   \
    rcs

### Input/Output
setopt                   \
    aliases              \
    clobber              \
 no_correct              \
 no_correct_all          \
 no_dvorak               \
    flow_control         \
 no_ignore_eof           \
    interactive_comments \
    hash_cmds            \
 no_hash_dirs            \
 no_mail_warn            \
    path_dirs            \
    path_script          \
 no_print_eight_bit      \
 no_print_exit_value     \
    rc_quotes            \
 no_rm_star_silent       \
 no_rm_star_wait         \
    short_loops          \
 no_sun_keyboard_hack

### Job-Control
setopt            \
 no_auto_continue \
    auto_resume   \
 no_check_jobs    \
 no_hup           \
    long_list_jobs\
    monitor       \
 no_notify        \
 no_posix_jobs

### Prompting
setopt               \
    prompt_bang      \
    prompt_cr        \
    prompt_sp        \
    prompt_percent   \
    prompt_vars      \
 no_transient_rprompt

### Scripts And Functions
setopt              \
 no_c_bases         \
    c_precedences   \
    debug_before_cmd\
 no_err_exit        \
    err_return      \
 no_eval_lineno     \
    exec            \
    function_argzero\
 no_local_options   \
    local_traps     \
    multi_func_def  \
    multios         \
 no_octal_zeroes    \
 no_source_trace    \
    typeset_silent  \
 no_verbose         \
 no_xtrace

### Shell-Emulation
setopt                \
 no_bash_rematch      \
 no_bsd_echo          \
 no_csh_junkie_history\
    csh_junkie_loops  \
 no_csh_junkie_quotes \
 no_csh_nullcmd       \
 no_ksh_arrays        \
 no_ksh_autoload      \
    ksh_option_print  \
 no_ksh_typeset       \
    ksh_zero_subscript\
    posix_aliases     \
    posix_builtins    \
 no_posix_identifiers \
 no_posix_strings     \
 no_posix_traps       \
 no_sh_file_expansion \
 no_sh_nullcmd        \
    sh_option_letters \
    sh_word_split     \
    traps_async

### Shell-State
setopt        \
 no_restricted

### Zle
setopt             \
 no_beep           \
    combining_chars\
 no_single_line_zle\
 no_overstrike     \
    zle

[[ $LOAD_BAR == true ]] && echo -n '█'

#### FUNCTIONS & ALIASES -------------------------------------------------------
## It's a good idea to store your aliases in their own file, so that you can
## source them from multiple shells.
[[ -f "$HOME/.aliasrc"    ]] && source "$HOME/.aliasrc"
[[ -f "$HOME/.dosaliasrc" ]] && source "$HOME/.dosaliasrc"
[[ $PLUGINS == true ]] && alias 'reload'='src' ## Reload zsh configuration.  A more sensible name for the function in the zsh_reload plugin.
[[ $LOAD_BAR == true ]] && echo -n '█'



#### FINALIZATION --------------------------------------------------------------
### Activate Plugins
[[ $PLUGINS  == true ]] && antigen-apply
[[ $LOAD_BAR == true ]] && echo -n '█'

## Cleanup
unset LOAD_BAR\
      PLUGINS

### Make The Display Pretty
#NOTE:  Order important!
clear && echo
if [[ "$(pwd)" == "$HOME" ]]; then
	## If the user has another home directory in the same directory with a name
	## equivalent to the user's username, except that at least the first letter
	## is capitalized;  then cd that directory to avoid ls spam.
	CAPS_USERNAME="$(tr '[:lower:]' '[:upper:]' <<< ${NORMAL_USERNAME:0:1})${NORMAL_USERNAME:1}"  ## Thanks, http://stackoverflow.com/a/12487465.
	if [[ -d "$HOME/../$CAPS_USERNAME" ]]; then
		cd "$HOME/../$CAPS_USERNAME"
	else
		ls
	fi
else
	ls
fi
