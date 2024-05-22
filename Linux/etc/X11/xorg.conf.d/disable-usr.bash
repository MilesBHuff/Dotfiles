#!/usr/bin/env bash
## Disables the xorg.confs installed by packages
DIR='/usr/share/X11/xorg.conf.d'
  if [[ -d "$DIR"       ]]; then
	mv -fv "$DIR" "${DIR}.bak"
elif [[ -d "${DIR}.bak" ]]; then
	mv -fv "${DIR}.bak" "$DIR"
fi
