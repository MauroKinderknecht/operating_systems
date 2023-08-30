#!/bin/bash

ps aux --sort=-%mem | head -n 11 > memory.txt