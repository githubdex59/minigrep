#!/bin/bash

# Define the man page file and the destination directory
MAN_PAGE="minigrep.1"
MAN_DIR="/usr/share/man/man1"

# Check if the man page file exists
if [ ! -f "$MAN_PAGE" ]; then
    echo "Error: $MAN_PAGE not found in the current directory."
    exit 1
fi

# Check if the user has sufficient permissions
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or use sudo."
    exit 1
fi

# Copy the man page to the appropriate directory
echo "Installing $MAN_PAGE to $MAN_DIR..."
cp "$MAN_PAGE" "$MAN_DIR"

# Update the man database
echo "Updating man database..."
mandb

# Confirm success
echo "$MAN_PAGE has been successfully installed. You can now use 'man minigrep'."
