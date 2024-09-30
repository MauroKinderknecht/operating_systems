#!/bin/bash

if [ -z "$2" ]; then
    echo "Uso: $0 <directorio> <tamaño_mínimo_bytes>"
    exit 1
fi

DIRECTORIO=$1
TAMANO_MIN=$2

# Usar find para encontrar archivos y xargs para pasar los archivos a du para mostrar el tamaño en bytes
find "$DIRECTORIO" -type f -print0 | xargs -0 du -b | while read -r size file; do
    # Comparar el tamaño actual con el tamaño mínimo
    if [ "$size" -ge "$TAMANO_MIN" ]; then
        echo "$file (tamaño: $size bytes)"
    fi
done