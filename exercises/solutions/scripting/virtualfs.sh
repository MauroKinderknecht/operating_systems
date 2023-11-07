#!/bin/bash

# Function to check if a directory is empty
is_directory_empty() {
    if [ -z "$(ls -A "$1")" ]; then
        return 0
    else
        return 1
    fi
}

# Function to create a virtual filesystem image file
create_virtualfs() {
    if [ $# -ne 2 ]; then
        echo "Usage: $0 create <image_file> <size>"
        exit 1
    fi

    image_file="$1"
    size="$2"

    if [ -e "$image_file" ]; then
        echo "Error: Image file '$image_file' already exists."
        exit 1
    fi

    if ! [[ "$size" =~ ^[0-9]+[MmGgTtPpEeZzYy]? ]]; then
        echo "Error: Invalid size format. Use a valid size format, e.g., '100M' for 100 megabytes."
        exit 1
    fi

    dd if=/dev/zero of="$image_file" bs=1 count=0 seek="$size"
    echo "Virtual filesystem image file '$image_file' created with size '$size'."
}

# Function to format the virtual filesystem image file
format_virtualfs() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 format <image_file>"
        exit 1
    fi

    image_file="$1"

    if [ ! -e "$image_file" ]; then
        echo "Error: Image file '$image_file' does not exist."
        exit 1
    fi

    mkfs.ext4 "$image_file"
    echo "Virtual filesystem image file '$image_file' formatted with ext4."
}

# Function to mount the virtual filesystem
mount_virtualfs() {
    if [ $# -ne 2 ]; then
        echo "Usage: $0 mount <image_file> <mount_point>"
        exit 1
    fi

    image_file="$1"
    mount_point="$2"

    if [ ! -e "$image_file" ]; then
        echo "Error: Image file '$image_file' does not exist."
        exit 1
    fi

    if [ ! -d "$mount_point" ]; then
        echo "Error: Mount point '$mount_point' does not exist."
        exit 1
    fi

    if ! is_directory_empty "$mount_point"; then
        echo "Error: Mount point '$mount_point' is not empty."
        exit 1
    fi

    mount -o loop "$image_file" "$mount_point"
    echo "Virtual filesystem '$image_file' mounted to '$mount_point'."
}

# Function to unmount the virtual filesystem
unmount_virtualfs() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 unmount <mount_point>"
        exit 1
    fi

    mount_point="$1"

    if [ ! -d "$mount_point" ]; then
        echo "Error: Mount point '$mount_point' does not exist."
        exit 1
    fi

    if ! mountpoint -q "$mount_point"; then
        echo "Error: Mount point '$mount_point' is not currently mounted."
        exit 1
    fi

    umount "$mount_point"
    echo "Virtual filesystem at '$mount_point' has been unmounted."
}

# Help function
print_help() {
    echo "Usage: $0 <command> <args>"
    echo "Commands:"
    echo "  create <image_file> <size>  - Create a virtual filesystem image file."
    echo "  format <image_file>         - Format the virtual filesystem image file with ext4."
    echo "  mount <image_file> <mount_point> - Mount the virtual filesystem to a directory."
    echo "  unmount <mount_point>       - Unmount the virtual filesystem."
}

# Main script
if [ "$EUID" -ne 0 ]; then
    echo "Error: Permission denied. You must run this script as root."
    exit 1
fi

if [ $# -eq 0 ]; then
    print_help
    exit 0
fi

case "$1" in
    create)
        shift
        create_virtualfs "$@"
        ;;
    format)
        shift
        format_virtualfs "$@"
        ;;
    mount)
        shift
        mount_virtualfs "$@"
        ;;
    unmount)
        shift
        unmount_virtualfs "$@"
        ;;
    help)
        print_help
        exit 0
        ;;
    *)
        echo "Invalid command: $1"
        print_help
        exit 1
        ;;
esac

exit 0
