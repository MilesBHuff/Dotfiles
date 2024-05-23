#!/usr/bin/env bash
## Copyright © by Miles Bradley Huff from 2016-2018 per the LGPL3 (the Third Lesser GNU Public License)
##
## This file executes only on login bash shells.

declare FILE
FILE='.profile' && [[ -r "$FILE" ]] && source "$FILE" ## Source the global login shell config.
FILE='.bashrc'  && [[ -r "$FILE" ]] && source "$FILE" ## Source the non-login bash config
unset FILE
