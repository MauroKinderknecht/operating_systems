#!/bin/bash

# Count files grouped by extension in the current directory
find . -type f | sed -n 's/.*\.//p' | sort | uniq -c | sort -nr