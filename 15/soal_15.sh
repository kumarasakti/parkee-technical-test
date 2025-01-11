#!/bin/bash


email_to="your-email@example.com"
email_subject="Disk Usage Alert"

send_email_notification() {
    local message="$1"
    echo "$message" | mail -s "$email_subject" "$email_to"
}

while true; do
    disk_usage=$(df -h / | tail -n 1 | awk '{print $5}' | cut -d'%' -f1)
    
    if [ "$disk_usage" -gt 80 ]; then
        message="WARNING: High Disk Usage!
        Current usage: ${disk_usage}%
        Server: $(hostname)
        Date: $(date)"
        
        send_email_notification "$message"
        
        sleep 3600
    else
        sleep 300
    fi
done
