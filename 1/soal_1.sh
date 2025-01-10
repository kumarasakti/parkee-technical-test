#!/bin/bash

# Check if correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Invalid number of arguments"
    echo "Usage: $0 <directory> <file_extension>"
    exit 1
fi

directory="$1"
extension="$2"

# Check if directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist"
    exit 1
fi

# Remove leading dot from extension if present
extension="${extension#.}"

# Search for files and store results
found_files=$(find "$directory" -type f -name "*.$extension" 2>/dev/null)

# Check if any files were found
if [ -z "$found_files" ]; then
    echo "No files with extension '.$extension' found in '$directory'"
    exit 0
fi

# Display results
echo "Files with extension '.$extension' found in '$directory':"
echo "$found_files" | while read -r file; do
    echo "- $(basename "$file")"
done
