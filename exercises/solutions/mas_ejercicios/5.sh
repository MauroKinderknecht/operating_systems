#!/bin/bash
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_proceso>"
    exit 1
fi

PROCESO=$1
ps aux | grep $PROCESO | awk '{print "Usuario:", $1}'