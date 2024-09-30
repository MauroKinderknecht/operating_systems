#!/bin/bash
ps aux --sort=-%cpu | awk '$3 > 20 {print $0}'