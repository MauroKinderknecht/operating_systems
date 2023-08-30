#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <string> <number>"
    exit 1
fi

s=$1
n=$2

while true; do
    echo "$s"
    sleep $n
done
