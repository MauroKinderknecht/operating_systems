#!/bin/bash

if [ -z "$1" ]; then
    echo "Por favor, ingresa un número de puerto."
    exit 1
fi

port=$1
pid=$(lsof -ti :$port)

if [ -z "$pid" ]; then
    echo "El puerto $port no está en uso."
    exit 0
fi

echo "El puerto $port está en uso por el proceso PID: $pid."

echo "Presiona ENTER para matar el proceso o cualquier otra tecla para cancelar."
read -n 1 -s KEY

if [ -z $KEY ]; then
    kill -9 $pid
    echo "Proceso $pid finalizado"
else 
    echo "Operacion cancelada"
fi