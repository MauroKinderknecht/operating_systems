#!/bin/bash

if [ -z "$1" ]; then
    echo "Por favor, ingresa el nombre del proceso."
    exit 1
fi

ps aux | grep $1 | while read -r line; do
    set -- $line
    echo "PID: $2, Usuario: $1, Uso de memoria: $4%"
done