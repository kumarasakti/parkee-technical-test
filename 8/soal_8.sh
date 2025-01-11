#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 <username> <ip_address>"
    exit 1
fi

username=$1
ip_address=$2

ssh -o ConnectTimeout=5 -o BatchMode=yes "$username@$ip_address" exit 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Connection successful to $ip_address"
else
    echo "Connection failed to $ip_address"
fi