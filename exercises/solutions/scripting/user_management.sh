#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Error: Permission denied. You must run this script as root."
    exit 1
fi

while [ $# -gt 0 ]; do
    case "$1" in
        --user)
            shift
            username="$1"
            echo "user $username"
            shift
            ;;

        --add-user)
            shift
            username="$1"
            echo "create $username"
            shift
            ;;

        --delete-user)
            shift
            echo "delete $username"
            ;;

        --add-to-group)
            shift
            group="$1"
            echo "add $username to $group"
            shift
            ;;

        --remove-from-group)
            shift
            group="$1"
            echo "remove $username from $group"
            shift
            ;;

        --change-password)
            shift
            echo "change password for $username"
            ;;

        --from-file)
            shift
            file="$1"
            echo "from file $file"
            shift
            ;;

        *)
            echo "Invalid option: $1"
            exit 1
            ;;
    esac
done
