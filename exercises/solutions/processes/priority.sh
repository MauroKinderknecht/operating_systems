#!/bin/bash

if [ -z "$1" ]; then
    echo "Por favor, ingresa el nombre del proceso."
    exit 1
fi

nice -n 10 "$@"`