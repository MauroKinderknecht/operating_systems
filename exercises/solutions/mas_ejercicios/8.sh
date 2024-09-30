#!/bin/bash
DIRECTORIO=$1

if [ -z "$DIRECTORIO" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

while true; do
    archivos=$(find $DIRECTORIO -type f -size +10M)
    if [ ! -z "$archivos" ]; then
        echo "Alerta: Archivos mayores a 10MB encontrados:"
        echo "$archivos"
    fi
    sleep 5
done