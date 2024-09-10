#!/bin/bash

# Check if directory is specified
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Find and display the 5 largest files in the specified directory
find "$1" -type f | xargs du -h | sort -rh | head -n 5

# For current directory is easier
# ls -sS | head -n 5