#!/bin/bash

# Function to list files and directories
list_files() {
    local dir="$1"
    local files=($(find "$dir" -maxdepth 1 -type f -print0 | xargs -0 -n1 basename))
    local dirs=($(find "$dir" -maxdepth 1 -type d -print0 | xargs -0 -n1 basename | grep -v '^\.$'))

    # Combine files and directories, sorting them
    local combined=("${files[@]}" "${dirs[@]}")
    printf '%s\n' "${combined[@]}"
}

# Initial directory
current_dir=~/.config
history_file="/tmp/browse-configs-history.txt"

# Ensure history file exists
touch "$history_file"

# Main loop
while true; do
    # List files and directories in the current directory
    items=$(list_files "$current_dir")
    
    # Use rofi to choose an item
    selected=$(printf '%s\n' "$items" | rofi -dmenu -p "Select a file to open with vim:")

    # Check if a selection was made
    if [ -n "$selected" ]; then
        # Check if the selection is a directory
        if [ -d "$current_dir/$selected" ]; then
            # Navigate into the selected directory
            current_dir="$current_dir/$selected"
            # Update history
            echo "$current_dir" > "$history_file"
        elif [ -f "$current_dir/$selected" ]; then
            # Open the selected file with Vim
            kitty vim "$current_dir/$selected"
            break
        else
            # Handle case where the selection is neither a file nor a directory
            echo "Invalid selection" >&2
        fi
    else
        # Handle case where no selection was made (e.g., exit loop)
        break
    fi
done

