#!/usr/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# Battery percentage at which to notify
WARNING_LEVEL=30
CRITICAL_LEVEL=10
SUSPEND_LEVEL=3
BATTERY_DISCHARGING=$(acpi -b | grep "Battery 0" | grep -c "Discharging")
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')

# Use files to store whether we've shown a notification or not (to prevent multiple notifications)
FULL_FILE=/tmp/batteryfull
EMPTY_FILE=/tmp/batteryempty
CRITICAL_FILE=/tmp/batterycritical

# Reset notifications if the computer is charging/discharging
if [ "$BATTERY_DISCHARGING" -eq 1 ] && [ -f $FULL_FILE ]; then
	rm $FULL_FILE
elif [ "$BATTERY_DISCHARGING" -eq 0 ] && [ -f $EMPTY_FILE ]; then
	rm $EMPTY_FILE
fi

# If the battery is charging and is full (and has not shown notification yet)
if [ "$BATTERY_LEVEL" -gt 99 ] && [ "$BATTERY_DISCHARGING" -eq 0 ] && [ ! -f $FULL_FILE ]; then
	notify-send "Battery Charged" "Battery is fully charged." 
	touch $FULL_FILE
	# If the battery is low and is not charging (and has not shown notification yet)
elif [ "$BATTERY_LEVEL" -le $WARNING_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ] && [ ! -f $EMPTY_FILE ]; then
	notify-send "Low Battery" "${BATTERY_LEVEL}% of battery remaining." -u critical 
	touch $EMPTY_FILE
	# If the battery is critical and is not charging (and has not shown notification yet)
elif [ "$BATTERY_LEVEL" -le $CRITICAL_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ] && [ ! -f $CRITICAL_FILE ]; then
	notify-send "Battery Critical" "The computer will shutdown soon." -u critical 
	touch $CRITICAL_FILE
	# If the battery is absolutely critical and is not charging 
elif [ "$BATTERY_LEVEL" -le $SUSPEND_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ]; then
    systemctl hibernate
fi