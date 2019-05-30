#!/bin sh
## This script is a convenient means by which to manage your fontconfigs.
## Copyright © by Miles Bradley Huff from 2016-2019 per the LGPL3 (the Third Lesser GNU Public License)

DIR_OUT='/etc/fonts/conf.d'
if [ -d $DIR_OUT ]; then
	echo ':: Clearing config directory...'
	rm -fv $DIR_OUT/*.conf
	echo ':: Done.'
else
	>&2 echo "ERROR:  Can't find configuration-directory!'"
	exit 1
fi

DIR_IN='/etc/fonts/conf.avail'
if [ -d $DIR_IN ]; then
	echo ':: Creating symlinks from conf.avail...'

	## General Settings
	CONF="$DIR_IN/10-autohint.conf"          && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/10-hinting-slight.conf"    && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/10-sub-pixel-rgb.conf"     && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/11-lcdfilter-default.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/70-yes-bitmaps.conf"       && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/90-synthetic.conf"         && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Generate fake italic and bold styles for fonts without them.
	#CONF="$DIR_IN/.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"

	## Font-Specific Settings
	CONF="$DIR_IN/20-unhint-small-dejavu-sans.conf"      && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/20-unhint-small-dejavu-sans-mono.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/20-unhint-small-dejavu-serif.conf"     && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/20-unhint-small-vera.conf"             && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/31-cantarell.conf"                     && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/80-delicious.conf"                     && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/81-ubuntu.conf"                        && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	#CONF="$DIR_IN/.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"

	## Replacement-Settings
	CONF="$DIR_IN/29-replace-bitmap-fonts.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Misleading name.  Just replaces, ie, Times with Times New Roman.
	CONF="$DIR_IN/30-metric-aliases.conf"       && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Replace missing fonts with comparably metricked ones.
	CONF="$DIR_IN/40-nonlatin.conf"             && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/49-sans-serif.conf"           && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/57-dejavu-sans.conf"          && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/57-dejavu-sans-mono.conf"     && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/57-dejavu-serif.conf"         && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	#CONF="$DIR_IN/.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"

	## Additional Configurations
	CONF="$DIR_IN/50-user.conf"  && [ -f $CONF ] && ln -sv $CONF $DIR_OUT/
	CONF="$DIR_IN/51-local.conf" && [ -f $CONF ] && ln -sv $CONF $DIR_OUT/
	#CONF="$DIR_IN/.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"

	echo ':: Done.'
fi

DIR_IN='/etc/fonts/conf.avail.infinality'
if [ -d $DIR_IN ]; then
	echo ':: Creating symlinks from conf.avail.infinality...'

	## General Settings
	CONF="$DIR_IN/82-no-embedded-bitmaps.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/82-no-force-autohint.conf"   && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/82-no-ttf-as-bitmap.conf"    && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"
	CONF="$DIR_IN/94-no-synthetic.conf"        && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Prevents synthetic functions from applying to bitmap-fonts.
	#CONF="$DIR_IN/.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"

	## Font-Specific Settings
	CONF="$DIR_IN/67-override-aliases.conf"              && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Fixes some fonts whose family-names might vary.
	CONF="$DIR_IN/68-override.conf"                      && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Contains some font-specific rendering-settings.
	CONF="$DIR_IN/90-non-tt-fonts.conf"                  && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Autohints fonts known to lack hinting.
	CONF="$DIR_IN/90-tt-fonts-microsoft.conf"            && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Disables autohinting for Microsoft fonts known to have hinting.
	CONF="$DIR_IN/90-tt-fonts-misc.conf"                 && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Same as above, but handles non-Microsoft fonts.
	CONF="$DIR_IN/92-selective-rendering-microsoft.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Contains variable font-specific rendering-instructions for certain Microsoft-fonts.
	CONF="$DIR_IN/92-selective-rendering-misc.conf"      && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Same as above, but handles non-Microsoft fonts.
	#CONF="$DIR_IN/.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"

	## Replacement-Settings
	CONF="$DIR_IN/40-non-latin-microsoft.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## This just assigns default families to Microsoft fonts, so that comparable fonts will be rendered if they're missing.
	CONF="$DIR_IN/40-non-latin-misc.conf"      && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Same as above, but handles non-Microsoft fonts.
	CONF="$DIR_IN/45-latin-microsoft.conf"     && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Same as above, but handles Microsoft Latin fonts.
	CONF="$DIR_IN/45-latin-misc.conf"          && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"  ## Same as above, but handles non-Microsoft fonts.
	#CONF="$DIR_IN/.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"

	## From Infinality's Font-Presets
	DIR_IN="$DIR_IN/combi"
	CONF="$DIR_IN/37-repl-global-combi.conf" && [ -f "$CONF" ] && ln -sv "$CONF" "$DIR_OUT/"

	echo ':: Done.'
fi

DIR_IN='/etc/fonts/conf.avail.custom'
if [ -d $DIR_IN ]; then
	echo ':: Creating symlinks from conf.avail.custom...'
	ln -sv "$DIR_IN/"* "$DIR_OUT/"
	echo ':: Done.'
fi
## Cleanup
unset CONF    \
      DIR_IN  \
      DIR_OUT
exit 0
