#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <public_key_file> <username> <server_ip>"
    exit 1
fi

pubkey_file=$1
username=$2
server_ip=$3

# Create local .ssh directory if it doesn't exist
mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [ ! -f "$pubkey_file" ]; then
    echo "Error: Public key file '$pubkey_file' not found"
    exit 1
fi

if command -v ssh-copy-id &> /dev/null; then
    ssh-copy-id -i "$pubkey_file" "${username}@${server_ip}"
else
    echo "ssh-copy-id not found, using manual copy method..."
    
    ssh "${username}@${server_ip}" 'mkdir -p ~/.ssh'
    
    cat "$pubkey_file" | ssh "${username}@${server_ip}" 'cat >> ~/.ssh/authorized_keys'
    
    ssh "${username}@${server_ip}" 'chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys'
fi

echo "Public key has been successfully copied to ${username}@${server_ip}"