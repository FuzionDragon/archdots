#!/usr/bin/bash

chosen=$(printf "  Power Off\n Restart\n Suspend\n Hibernate\n Logout\n  Lock" | rofi -dmenu -i)

case "$chosen" in 
	"  Power Off") poweroff ;;
	" Restart") reboot ;;
	" Logout") hyprctl dispatch exit ;;
	" Suspend") systemctl suspend ;;
	" Hibernate") systemctl hibernate ;;
	"  Lock") hyprlock ;;
	*) exit 1 ;;
esac
