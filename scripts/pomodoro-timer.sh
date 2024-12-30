!#/usr/bin/bash
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

notify-send 'Take a break!' '30 minutes have passed, stand up and stretch'
