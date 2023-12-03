#!/bin/bash

# Crear un script que permita manejar acceso  y cumpla con los siguientes requerimientos:  		
# - Dado un archivo, dar acceso de lectura, escritura o ejecución para un usuario o grupo

# Asegurarse de que el script pida los permisos necesarios para ejecutar los comandos y manejar potenciales errores o conflictos.

# Usage:	
# ./script.sh <path_to_file> user --read --write --exec
# ./script.sh <path_to_file> group --read --write --exec

# Functions

function read_access {
    if [ "$1" = "user" ]; then
        chmod u+r "$2"
    elif [ "$1" = "group" ]; then
        chmod g+r "$2"
    fi
}

function write_access {
    if [ "$1" = "user" ]; then
        chmod u+w "$2"
    elif [ "$1" = "group" ]; then
        chmod g+w "$2"
    fi
}

function exec_access {
    if [ "$1" = "user" ]; then
        chmod u+x "$2"
    elif [ "$1" = "group" ]; then
        chmod g+x "$2"
    fi
}

# Main

path = "$1"
user_or_group = "$2"
shift 2

while [ $# -gt 0 ]; do
    case "$1" in
        --read)
            read_access "$user_or_group" "$path"
            ;;
        --write)
            write_access "$user_or_group" "$path"
            ;;
        --exec)
            exec_access "$user_or_group" "$path"
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
    shift
done
