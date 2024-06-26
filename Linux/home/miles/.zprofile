#!/usr/bin/env zsh
## Copyright © by Miles Bradley Huff from 2016-2018 per the LGPL3 (the Third Lesser GNU Public License)
##
## This file is a shim that loads `~/.bash_profile`.
FILE='.bash_profile' && [[ -f "$FILE" ]] && emulate bash -c "source $FILE"
emulate zsh
