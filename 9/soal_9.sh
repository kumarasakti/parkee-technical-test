#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 <public_key_file_location> <username>"
    exit 1
fi


public_key_file="$1"
username="$2"


if [ ! -f "$public_key_file" ]; then
    echo "Error: Public key file '$public_key_file' not found"
    exit 1
fi

if ! id "$username" >/dev/null 2>&1; then
    echo "Error: User '$username' does not exist"
    exit 1
fi

user_home=$(eval echo ~$username)

ssh_dir="$user_home/.ssh"
if [ ! -d "$ssh_dir" ]; then
    mkdir -p "$ssh_dir"
    chown "$username:$username" "$ssh_dir"
    chmod 700 "$ssh_dir"
fi

auth_keys_file="$ssh_dir/authorized_keys"
cat "$public_key_file" >> "$auth_keys_file"

chown "$username:$username" "$auth_keys_file"
chmod 600 "$auth_keys_file"

echo "Public key has been successfully added for user $username"