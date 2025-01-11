#!/bin/bash


scp_transfer() {
    local source_file="$1"
    local remote_user="$2"
    local remote_ip="$3"

    if [ -f "$source_file" ]; then
        scp "$source_file" "$remote_user@$remote_ip:~/"
        if [ $? -eq 0 ]; then
            echo "File successfully transferred using SCP"
        else
            echo "SCP transfer failed"
        fi
    else
        echo "Source file does not exist"
    fi
}


rsync_transfer() {
    local source_file="$1"
    local remote_user="$2"
    local remote_ip="$3"

    if [ -f "$source_file" ]; then
        rsync -avz "$source_file" "$remote_user@$remote_ip:~/"
        if [ $? -eq 0 ]; then
            echo "File successfully transferred using RSYNC"
        else
            echo "RSYNC transfer failed"
        fi
    else
        echo "Source file does not exist"
    fi
}


if [ $# -ne 3 ]; then
    echo "Usage: $0 <source_file> <username> <remote_ip>"
    exit 1
fi


echo "Performing SCP transfer..."
scp_transfer "$1" "$2" "$3"

echo -e "\nPerforming RSYNC transfer..."
rsync_transfer "$1" "$2" "$3"