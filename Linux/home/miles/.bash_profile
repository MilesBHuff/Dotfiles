#!/usr/bin/env bash
## Copyright © by Miles Bradley Huff from 2016-2018 per the LGPL3 (the Third Lesser GNU Public License)
##
## This file executes only on login bash shells.

function _import { [[ -r "$1" ]] && source "$1"; }
_import "$HOME/.profile" ## Source the global login shell config.
_import "$HOME/.bashrc"  ## Source the non-login bash config
