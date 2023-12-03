#!/bin/bash

# Crear un script que permita manejar usuarios y cumpla con los siguientes requerimientos:
# - Crear un usuario
# - Borrar un usuario
# - Cambiar la contraseña de un usuario
# - Agregar el usuario a sudoers

# Asegurarse de que el script pida los permisos necesarios para ejecutar los comandos y manejar potenciales errores o conflictos.

# Usage:
# ./script.sh create <username>
# ./script.sh delete <username>
# ./script.sh passwd <username>
# ./script.sh sudoers <username>


# Functions

function create_user {
    if id "$1" &>/dev/null; then
        echo "User $1 already exists"
    else
        # Create user
        useradd -m "$1"
        echo "User $1 created"
    fi
}

function delete_user {
    if id "$1" &>/dev/null; then
        # Delete user
        userdel -r "$1"
        echo "User $1 deleted"
    else
        echo "User $1 does not exist"
    fi
}

function change_password {
    if id "$1" &>/dev/null; then
        # Change password
        passwd "$1"

        # also could be
        # read -s -p "Enter new password: " password
        # echo "$1:$password" | chpasswd
    else
        echo "User $1 does not exist"
    fi
}

function add_to_sudoers {
    if id "$1" &>/dev/null; then
        # Add user to sudoers
        echo "$1 ALL=(ALL) ALL" >> /etc/sudoers
        echo "User $1 added to sudoers"
    else
        echo "User $1 does not exist"
    fi
}

# Main

# Check if user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Check if there are arguments
if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    exit 1
fi

case "$1" in
    create)
        create_user "$2"
        ;;
    delete)
        delete_user "$2"
        ;;
    passwd)
        change_password "$2"
        ;;
    sudoers)
        add_to_sudoers "$2"
        ;;
    *)
        echo "Invalid option"
        exit 1
        ;;
esac
