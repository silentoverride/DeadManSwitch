#!/bin/bash

source ./.hashed-password

function start_timer() {
	for ((i=1; i<=3600; i++)) {
    echo $i
    echo "# $((i))%"
    sleep 1
	} | yad --progress \
  				--text="Unlocking Vault..." \
  				--width=300 \
  				--buttons-layout=end \
  				--button="OK:0" \
  				--button="Cancel:1" \
  				--auto-kill
}

function confirm_passwd() {
	INPUTTEXT=$(yad \
								--text-align=center \
								--text="Unlock Password" \
								--entry \
								--ricon=gtk-clear \
								--hide-text \
								--entry-label=Password \
								--entry-text="Enter Vault Password" \
								)
	INPUTHASH=$(echo "$INPUTTTEXT" | sha256sum -t)
	if [[ "$HASH" == "$INPUTHASH" ]]; then
		$(ps aux | grep 'dmswitch') && \
		$(sudo dmswitch --conf /etc/dmswitch/config.toml) \
		echo "dmswitch reset"
	fi
}
