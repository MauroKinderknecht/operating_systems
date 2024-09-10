#!/bin/bash

# Check if both source and destination directories are specified
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <source_directory> <backup_directory>"
  exit 1
fi

src_dir=$1
backup_dir=$2

# Check if source directory exists
if [ ! -d "$src_dir" ]; then
  echo "Source directory does not exist."
  exit 1
fi

# Create backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
  mkdir -p "$backup_dir"
fi

# Create the backup (with timestamp to avoid overwriting)
backup_name="backup_$(basename "$src_dir")_$(date +%Y%m%d%H%M%S).tar.gz"
tar -czf "$backup_dir/$backup_name" -C "$src_dir" .

echo "Backup of '$src_dir' created at '$backup_dir/$backup_name'"