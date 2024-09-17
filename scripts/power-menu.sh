#!/bin/bash

# Define options
options="Logout\nShutdown\nReboot\nSuspend"

# Get user selection
selected=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -l 4)

# Perform action based on selection
case $selected in
    Logout)
        # Close Hyprland (logout)
        hyprctl dispatch exit ;;
    Shutdown)
        # Shutdown the system
        systemctl poweroff ;;
    Reboot)
        # Reboot the system
        systemctl reboot ;;
    Suspend)
        # Suspend the system
        systemctl suspend ;;
    *)
        # Exit in case of invalid input or selection
        exit 1 ;;
esac

