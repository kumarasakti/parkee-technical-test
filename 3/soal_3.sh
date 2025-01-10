#!/bin/bash

echo "======================================"
echo "    File Statistics Counter"
echo "======================================"

print_header() {
    printf "\n%-40s %8s %8s %8s\n" "FILENAME" "LINES" "WORDS" "CHARS"
    echo "--------------------------------------------------------------------"
}

print_row() {
    printf "%-40s %8d %8d %8d\n" "$1" "$2" "$3" "$4"
}

if [ $# -ne 1 ]; then
    echo "Error: Please provide a directory path"
    echo "Usage: $0 <directory_path>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist"
    exit 1
fi

total_lines=0
total_words=0
total_chars=0
file_count=0

print_header

while IFS= read -r -d '' file; do
    
    stats=$(wc -lwm "$file")

    lines=$(echo "$stats" | awk '{print $1}')
    words=$(echo "$stats" | awk '{print $2}')
    chars=$(echo "$stats" | awk '{print $3}')

    ((total_lines+=lines))
    ((total_words+=words))
    ((total_chars+=chars))
    ((file_count++))

    filename=$(basename "$file")
    print_row "$filename" "$lines" "$words" "$chars"

done < <(find "$1" -type f -print0)

echo "--------------------------------------------------------------------"
print_row "TOTAL" "$total_lines" "$total_words" "$total_chars"
echo "--------------------------------------------------------------------"
