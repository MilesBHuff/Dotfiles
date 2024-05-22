#!/bin/sh
## This script is a convenient means by which to manage your fontconfigs.
## Copyright © by Miles Bradley Huff from 2016-2021 per the LGPL3 (the Third Lesser GNU Public License)

DIR_OUT='/etc/fonts/conf.d'
if [ -d $DIR_OUT ]; then
	echo ':: Clearing config directory...'
	rm -fv $DIR_OUT/*.conf
	echo ':: Done.'
else
	>&2 echo "ERROR:  Can't find configuration-directory!'"
	exit 1
fi

symlink_conf() {
	CONF="$DIR_IN/$1.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
}

DIR_IN='/usr/share/fontconfig/conf.avail'
if [ -d $DIR_IN ]; then
	echo ':: Creating symlinks from conf.avail...'

	## General Settings
	symlink_conf "10-autohint"
	symlink_conf "10-hinting-slight"
	symlink_conf "10-sub-pixel-rgb"
	symlink_conf "11-lcdfilter-default"
	symlink_conf "70-yes-bitmaps"
	symlink_conf "90-synthetic" ## Generate fake italic and bold styles for fonts without them.

	## Font-Specific Settings
	symlink_conf "20-unhint-small-*"
	symlink_conf "31-cantarell"
	symlink_conf "80-delicious"
	symlink_conf "81-ubuntu"

	## Replacement-Settings
	symlink_conf "29-replace-bitmap-fonts" ## Misleading name.  Just replaces, ie, "Times" with "Times New Roman".
	symlink_conf "30-metric-aliases"       ## Replace missing fonts with comparably metricked ones.
	symlink_conf "30-win32-aliases"
	symlink_conf "49-sans-serif"           ## Sets fonts with no generic family to sans-serif.
	symlink_conf "40-nonlatin"
	symlink_conf "45-latin"

	## Additional Configurations
	symlink_conf "50-user"
	symlink_conf "51-local"
	symlink_conf "35-lang-normalize" ## Makes sure all dialects are processed as belonging to their respective languages.

	echo ':: Done.'
fi

DIR_IN='/etc/fonts/infinality.avail'
if [ -d $DIR_IN ]; then
	echo ':: Creating symlinks from infinality.avail...'

	## General Settings
	symlink_conf "82-no-embedded-bitmaps"
	symlink_conf "82-no-force-autohint"
	symlink_conf "82-no-ttf-as-bitmap"
	symlink_conf "94-no-synthetic" ## Prevents synthetic functions from applying to bitmap-fonts.

	## Font-Specific Settings
	symlink_conf "67-override-aliases"              ## Fixes some fonts whose family-names might vary.
	symlink_conf "68-override"                      ## Contains some font-specific rendering-settings.
	symlink_conf "90-non-tt-fonts"                  ## Autohints fonts known to lack hinting.
	symlink_conf "90-tt-fonts-microsoft"            ## Disables autohinting for Microsoft fonts known to have hinting.
	symlink_conf "90-tt-fonts-misc"                 ## Same as above, but handles non-Microsoft fonts.
	symlink_conf "92-selective-rendering-microsoft" ## Contains variable font-specific rendering-instructions for certain Microsoft-fonts.
	symlink_conf "92-selective-rendering-misc"      ## Same as above, but handles non-Microsoft fonts.

	## Replacement-Settings
	symlink_conf "40-non-latin-microsoft" ## This just assigns default families to Microsoft fonts, so that comparable fonts will be rendered if they're missing.
	symlink_conf "40-non-latin-misc"      ## Same as above, but handles non-Microsoft fonts.
	symlink_conf "45-latin-microsoft"     ## Same as above, but handles Microsoft Latin fonts.
	symlink_conf "45-latin-misc"          ## Same as above, but handles non-Microsoft fonts.

	## From Infinality's Font-Presets
	DIR_IN="$DIR_IN/combi"
	symlink_conf "37-repl-global-combi"

	echo ':: Done.'
fi

DIR_IN='/etc/fonts/custom.avail'
if [ -d $DIR_IN ]; then
	echo ':: Creating symlinks from custom.avail...'
	ln -sv "$DIR_IN/"* "$DIR_OUT/"
	echo ':: Done.'
fi

## Cleanup
unset CONF    \
      DIR_IN  \
      DIR_OUT
exit 0
