#!/bin/bash

error_exit() {
    echo "Error: $1" >&2
    exit 1
}

validate_directory() {
    if [ ! -d "$1" ]; then
        error_exit "Directory '$1' does not exist"
    fi
}

sanitize_dirname() {
    echo "$1" | tr -cd '[:alnum:]_-' | tr '[:upper:]' '[:lower:]'
}

if [ $# -ne 2 ]; then
    error_exit "Invalid number of arguments\nUsage: $0 <source_directory> <backup_destination>"
fi

source_dir="$1"
backup_dir="$2"

validate_directory "$source_dir"
validate_directory "$backup_dir"

dir_name=$(basename "$source_dir")
sanitized_dir_name=$(sanitize_dirname "$dir_name")

timestamp=$(date +"%Y%m%d%H%M%S")
backup_filename="backup_${sanitized_dir_name}_${timestamp}.tar.gz"
backup_path="${backup_dir}/${backup_filename}"

echo "Start backup process of '$source_dir'..."
tar czf "$backup_path" -C "$(dirname "$source_dir")" "$(basename "$source_dir")" 2>/dev/null || {
    error_exit "Failed to create backup. Exiting..."
}

if [ -f "$backup_path" ]; then
    backup_size=$(du -h "$backup_path" | cut -f1)
    echo "Backup successful!" 
    echo "Backup file is located at '$backup_path'" 
    echo "with size of $backup_size"
else
    error_exit "Backup file was not created. Exiting..."
fi