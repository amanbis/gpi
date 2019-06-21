#!/bin/bash
HEIGHT=15
WIDTH=45
CHOICE_HEIGHT=8
BACKTITLE="Do you take the Blue Pill or the Red Pill?"
TITLE="Take a Chance, Make a Choice!"
MENU="Select sound channels (Reboot may be required):"
cd /home/pi

OPTIONS=(
		1 "Enable Mono Sound"
		2 "Enable Stereo Sound"
		)

CHOICE=$(dialog --clear \
				--backtitle "$BACKTITLE" \
				--title "$TITLE" \
				--menu "$MENU" \
				$HEIGHT $WIDTH $CHOICE_HEIGHT \
				"${OPTIONS[@]}" \
				2>&1 >/dev/tty)
clear
case $CHOICE in
		1)
		if [ -e /etc/asound.conf ]
			then
				echo Mono Sound Already Enabled
				sleep 4
			else
				sudo mv /etc/asound.bak /etc/asound.conf
				sudo reboot
			fi
		;;
		2)
		if [ -e /etc/asound.bak ]
			then
				echo Stereo Sound Already Enabled
				sleep 4
			else
				sudo mv /etc/asound.conf /etc/asound.bak
				sudo reboot
			fi
			;;
esac