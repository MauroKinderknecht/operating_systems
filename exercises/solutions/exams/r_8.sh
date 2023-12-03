#!/bin/bash

# Crear un script que gestione directorios y archivos con los siguientes requisitos:

# - Crear un directorio.
# - Borrar un directorio.
# - Crear un archivo dentro de un directorio existente.
# - Borrar un archivo.
# - Listar el contenido de un directorio.

# Asegurarse de que el script solicite permisos necesarios para ejecutar los comandos y manejar posibles errores o conflictos.

# Usage:
# ./script.sh create_dir <dir>
# ./script.sh delete_dir <dir>
# ./script.sh create_file <dir> <file>
# ./script.sh delete_file <file>
# ./script.sh list_content <dir>

# Functions

function create_dir {
    if [ -d "$1" ]; then
        echo "Directory $1 already exists"
    else
        mkdir "$1"
        echo "Directory $1 created"
    fi
}

function delete_dir {
    if [ -d "$1" ]; then
        rm -r "$1"
        echo "Directory $1 deleted"
    else
        echo "Directory $1 does not exist"
    fi
}

function create_file {
    if [ -d "$1" ]; then
        if [ -f "$1/$2" ]; then
            echo "File $1/$2 already exists"
        else
            touch "$1/$2"
            echo "File $1/$2 created"
        fi
    else
        echo "Directory $1 does not exist"
    fi
}

function delete_file {
    if [ -f "$1" ]; then
        rm "$1"
        echo "File $1 deleted"
    else
        echo "File $1 does not exist"
    fi
}

function list_content {
    if [ -d "$1" ]; then
        ls "$1"
    else
        echo "Directory $1 does not exist"
    fi
}

# Main

case "$1" in
    create_dir)
        create_dir "$2"
        ;;
    delete_dir)
        delete_dir "$2"
        ;;
    create_file)
        create_file "$2" "$3"
        ;;
    delete_file)
        delete_file "$2"
        ;;
    list_content)
        list_content "$2"
        ;;
    *)
        echo "Invalid option"
        ;;
esac