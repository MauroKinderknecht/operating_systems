#!/bin/bash
if [ -z "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

DIRECTORIO=$1

echo "Archivos menores a 1MB:"
find $DIRECTORIO -type f -size -1M

echo "Archivos entre 1MB y 10MB:"
find $DIRECTORIO -type f -size +1M -size -10M

echo "Archivos mayores a 10MB:"
find $DIRECTORIO -type f -size +10M