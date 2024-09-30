#!/bin/bash
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_proceso>"
    exit 1
fi

PROCESO=$1

while true; do
    if ! pgrep -x "$PROCESO" > /dev/null; then
        echo "$PROCESO se ha detenido. Reiniciando..."
        $PROCESO &
    fi
    sleep 5
done