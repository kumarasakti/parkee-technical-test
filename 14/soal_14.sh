#!/bin/bash

log_file="cpu_monitor.log"
threshold=75

get_cpu_usage() {
    cpu_usage=$(uptime | awk -F'load average: ' '{print $2}' | cut -d, -f1 | awk '{print $1 * 100}')
    echo ${cpu_usage%.*}
}

while true; do
    current_usage=$(get_cpu_usage)
    
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    if [ "$current_usage" -gt "$threshold" ]; then
        echo "$timestamp - WARNING: High CPU usage detected: $current_usage%" >> "$log_file"
    fi
    
    sleep 60
done
