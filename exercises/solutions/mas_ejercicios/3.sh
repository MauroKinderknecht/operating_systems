#!/bin/bash
while true; do
    clear
    ps aux --sort=-%mem | head -n 10
    sleep 5
done