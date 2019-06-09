#!/usr/bin/bash
## What to do when ClamAV detects a virus

## By Miles B Huff
## -----------------------------------------------------------------------------
#date >> '/var/log/clamav/detections.log'

## From Arch Wiki
## -----------------------------------------------------------------------------
#PATH=/usr/bin
alert="Signature detected: $CLAM_VIRUSEVENT_VIRUSNAME in $CLAM_VIRUSEVENT_FILENAME"

## Send the alert to systemd logger if exist, othewise to /var/log
if [[ -z $(command -v systemd-cat) ]]; then
	echo "$(date) - $alert" >> /var/log/clamav/detections.log
else
	## This could cause your DE to show a visual alert. Happens in Plasma, but the next visual alert is much nicer.
	echo "$alert" | /usr/bin/systemd-cat -t clamav -p emerg
fi

## Send an alert to all graphical users.
XUSERS=($(who|awk '{print $1$NF}'|sort -u))

for XUSER in $XUSERS; do
    NAME=(${XUSER/(/ })
    DISPLAY=${NAME[1]/)/}
    DBUS_ADDRESS=unix:path=/run/user/$(id -u ${NAME[0]})/bus
    echo "run $NAME - $DISPLAY - $DBUS_ADDRESS -" >> /tmp/testlog
    /usr/bin/sudo -u ${NAME[0]} DISPLAY=${DISPLAY} \
                       DBUS_SESSION_BUS_ADDRESS=${DBUS_ADDRESS} \
                       PATH=${PATH} \
                       /usr/bin/notify-send -i dialog-warning "clamAV" "$alert"
done

## Done
## -----------------------------------------------------------------------------
exit 0

