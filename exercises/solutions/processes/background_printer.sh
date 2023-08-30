#!/bin/bash

./printer.sh "Background Printing" 5 &
pid=$!

echo "ID del proceso: $pid"

renice -n 19 -p $pid
sleep 20
renice -n 5 -p $pid

read -p "Presiona ENTER para matar el proceso."
kill -9 $pid