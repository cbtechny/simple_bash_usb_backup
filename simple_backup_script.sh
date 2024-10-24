#!/bin/bash

# Which folder to back up
SOURCE_DIR="/path/to/source/directory"

# Path to USB
USB_BACKUP_DIR="/path/to/usb/directory"

# Verify that the folder you want back up actually exists!
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory $SOURCE_DIR does not exist."
    exit 1
fi

# Checks if the USB is mounted, if not, print Error
if [ ! -d "$USB_BACKUP_DIR" ]; then
    echo "Error: Destination directory $USB_BACKUP_DIR is not mounted."
    exit 1
fi

# Create a variable to hold the date
DATESTAMP=$(date +"%Y-%m-%d")

# Name the file using the DATESTAMP variable
BACKUP_ZIP="${USB_BACKUP_DIR}/backup_${DATESTAMP}.zip"

# Creates a zipped backup of the source directory onto the USB
if zip -r "$BACKUP_ZIP" "$SOURCE_DIR"; then
    # Print completed successfully...
    echo "Backup completed successfully. File saved as ${BACKUP_ZIP}"
else
    echo "Error: Backup failed."
    exit 1
fi
