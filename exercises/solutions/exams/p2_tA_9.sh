#!/bin/bash

# Crear un script que permita manejar paquetes  y cumpla con los siguientes requerimientos:	
# - Dado un paquete, verificar si está instalado
# - Instalar un paquete

# Asegurarse de que el script pida los permisos necesarios para ejecutar los comandos y manejar potenciales errores o conflictos.

# Usage:
# ./script.sh <package> --verify
# ./script.sh <package> --install 

# Functions

function verify_package {
    if dpkg -s "$1" &>/dev/null; then
        echo "Package $1 is installed"
    else
        echo "Package $1 is not installed"
    fi
}

function install_package {
    if dpkg -s "$1" &>/dev/null; then
        echo "Package $1 is already installed"
    else
        apt-get install "$1"
    fi
}

# Main

case "$2" in
    --verify)
        verify_package "$1"
        ;;
    --install)
        install_package "$1"
        ;;
    *)
        echo "Invalid option"
        ;;
esac