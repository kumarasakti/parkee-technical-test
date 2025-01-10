#!/bin/bash

echo "=== System Information ==="

echo "Hostname:"
hostname
echo


echo "Current Time:"
date "+%Y-%m-%d %H:%M:%S"
echo

echo "Currently Logged In Users:"
who
echo

echo "Total User Logged In:"
who | wc -l
echo

echo "=== End of System Information ==="