#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <unique_string> <username>"
    exit 1
fi

unique_string="$1"
username="$2"


auth_keys_file="/home/$username/.ssh/authorized_keys"


if [ ! -f "$auth_keys_file" ]; then
    echo "authorized_keys file not found for user $username"
    exit 1
fi

temp_file=$(mktemp)

grep -v "$unique_string" "$auth_keys_file" > "$temp_file"

cat "$temp_file" > "$auth_keys_file"

rm "$temp_file"

echo "Public key containing '$unique_string' has been removed for user $username"