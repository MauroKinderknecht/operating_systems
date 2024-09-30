#!/bin/bash
if [ -z "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

DIRECTORIO=$1

find $DIRECTORIO -type l -exec rm {} \;