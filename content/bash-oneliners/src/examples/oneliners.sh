#!/bin/bash

# Find all Go files modified in the last 7 days
find . -name "*.go" -mtime -7

# Search for TODO comments in all source files
grep -rn "TODO" --include="*.go" --include="*.py" .

# Count lines of code by file type
find . -name "*.go" | xargs wc -l | tail -1

# Replace text in multiple files
find . -name "*.md" -exec sed -i '' 's/oldtext/newtext/g' {} +

# Find large files (>100MB)
find . -type f -size +100M -exec ls -lh {} \;

# Kill processes matching a pattern
pgrep -f "node" | xargs kill -9

# Watch a log file with highlighting
tail -f app.log | grep --color=always -E "ERROR|WARNING|$"

# Disk usage by directory, sorted
du -sh */ | sort -hr | head -10

# Find and delete empty directories
find . -type d -empty -delete

# Extract unique IPs from access log
awk '{print $1}' access.log | sort -u | wc -l
