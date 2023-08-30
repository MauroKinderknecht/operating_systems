#!/bin/bash

if [ -z "$1" ]; then
    echo "Por favor, ingresa el nombre del proceso."
    exit 1
fi

ps aux | grep $1 | while read -r line; do
    set -- $line
    kill -9 $2
    echo "Proceso con PID $2 finalizado."
done