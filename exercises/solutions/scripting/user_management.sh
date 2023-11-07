#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Error: Permission denied. You must run this script as root."
    exit 1
fi

check_username() {
    if [ -z "$username" ]; then
        echo "Error: Username not specified."
        exit 1
    fi
}

while [ $# -gt 0 ]; do
    case "$1" in
        --user)
            shift
            username="$1"
            shift
            ;;
        --add-user)
            shift
            check_username
            if id "$username" &>/dev/null; then
                echo "User '$username' already exists."
            else
                useradd -m "$username"
                echo "User '$username' has been added."
            fi
            shift
            ;;
        --delete-user)
            shift
            check_username
            if id "$username" &>/dev/null; then
                userdel -r "$username"
                echo "User '$username' has been deleted."
            else
                echo "User '$username' does not exist."
            fi
            shift
            ;;
        --add-to-group)
            shift
            groupname="$1"
            if id "$username" &>/dev/null; then
                if grep -q "$groupname" /etc/group; then
                    usermod -aG "$groupname" "$username"
                    echo "User '$username' has been added to group '$groupname'."
                else
                    echo "Group '$groupname' does not exist."
                fi
            else
                echo "User '$username' does not exist."
            fi
            shift
            ;;
        --remove-from-group)
            shift
            groupname="$1"
            if id "$username" &>/dev/null; then
                if grep -q "$groupname" /etc/group; then
                    gpasswd -d "$username" "$groupname"
                    echo "User '$username' has been removed from group '$groupname'."
                else
                    echo "Group '$groupname' does not exist."
                fi
            else
                echo "User '$username' does not exist."
            fi
            shift
            ;;
        --change-password)
            shift
            if id "$username" &>/dev/null; then
                read -s -p "Enter new password for user '$username': " new_password
                echo
                echo "$username:$new_password" | chpasswd
                echo "Password for user '$username' has been changed."
            else
                echo "User '$username' does not exist."
            fi
            ;;
        --from-file)
            shift
            file="$1"
            if [ -f "$file" ]; then
                while IFS=';' read -r action username groupname; do
                    case "$action" in
                        add-to-group)
                            ./user_management.sh --add-to-group "$username" "$groupname"
                            ;;
                        remove-from-group)
                            ./user_management.sh --remove-from-group "$username" "$groupname"
                            ;;
                        change-password)
                            ./user_management.sh --change-password "$username"
                            ;;
                        delete-user)
                            ./user_management.sh --delete-user "$username"
                            ;;
                        *)
                            echo "Invalid action '$action' in file."
                            ;;
                    esac
                done < "$file"
            else
                echo "Error: File '$file' does not exist."
            fi
            shift
            ;;
        *)
            echo "Invalid option: $1"
            exit 1
            ;;
    esac
done
