#!/bin/bash
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_usuario>"
    exit 1
fi

USER=$1
ps -u $USER