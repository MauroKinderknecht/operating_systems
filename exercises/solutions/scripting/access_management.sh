#!/bin/bash

# Function to grant read access
grant_read_access() {
    if [ $# -ne 2 ]; then
        echo "Usage: $0 grant-read <user/group> <path>"
        exit 1
    fi

    user_or_group="$1"
    path="$2"

    if [ ! -e "$path" ]; then
        echo "Error: File or directory '$path' does not exist."
        exit 1
    fi

    if [ "$user_or_group" == "user" ]; then
        read_permission="u+r"
    elif [ "$user_or_group" == "group" ]; then
        read_permission="g+r"
    else
        echo "Error: Invalid user/group argument. Use 'user' or 'group'."
        exit 1
    fi

    chmod "$read_permission" "$path"
    echo "Read access granted to $user_or_group for '$path'."
}

# Function to grant write access
grant_write_access() {
    if [ $# -ne 2 ]; then
        echo "Usage: $0 grant-write <user/group> <path>"
        exit 1
    fi

    user_or_group="$1"
    path="$2"

    if [ ! -e "$path" ]; then
        echo "Error: File or directory '$path' does not exist."
        exit 1
    fi

    if [ "$user_or_group" == "user" ]; then
        write_permission="u+w"
    elif [ "$user_or_group" == "group" ]; then
        write_permission="g+w"
    else
        echo "Error: Invalid user/group argument. Use 'user' or 'group'."
        exit 1
    fi

    chmod "$write_permission" "$path"
    echo "Write access granted to $user_or_group for '$path'."
}

# Function to revoke read access
revoke_read_access() {
    if [ $# -ne 2 ]; then
        echo "Usage: $0 revoke-read <user/group> <path>"
        exit 1
    fi

    user_or_group="$1"
    path="$2"

    if [ ! -e "$path" ]; then
        echo "Error: File or directory '$path' does not exist."
        exit 1
    fi

    if [ "$user_or_group" == "user" ]; then
        read_permission="u-r"
    elif [ "$user_or_group" == "group" ]; then
        read_permission="g-r"
    else
        echo "Error: Invalid user/group argument. Use 'user' or 'group'."
        exit 1
    fi

    chmod "$read_permission" "$path"
    echo "Read access revoked for $user_or_group for '$path'."
}

# Function to list permissions
list_permissions() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 list-permissions <path>"
        exit 1
    fi

    path="$1"

    if [ ! -e "$path" ]; then
        echo "Error: File or directory '$path' does not exist."
        exit 1
    fi

    permissions=$(stat -c "%A" "$path")
    echo "Permissions for '$path': $permissions"
}

# Help function
print_help() {
    echo "Usage: $0 <command>"
    echo "Commands:"
    echo "  grant-read <user/group> <path>  - Grant read access to a user or group for a file or directory."
    echo "  grant-write <user/group> <path> - Grant write access to a user or group for a file or directory."
    echo "  revoke-read <user/group> <path> - Revoke read access from a user or group for a file or directory."
    echo "  list-permissions <path>         - List access permissions for a file or directory."
}

# Main script
if [ $# -eq 0 ]; then
    print_help
    exit 0
fi

case "$1" in
    grant-read)
        shift
        grant_read_access "$@"
        ;;
    grant-write)
        shift
        grant_write_access "$@"
        ;;
    revoke-read)
        shift
        revoke_read_access "$@"
        ;;
    list-permissions)
        shift
        list_permissions "$@"
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
