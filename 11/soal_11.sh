#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 <action> <service_name>"
    echo "Actions: start, stop, status"
    exit 1
fi

action=$1
service_name=$2

check_root() {
    if [ $(id -u) -ne 0 ]; then
        echo "This script must be run as root (sudo)"
        exit 1
    fi
}

case $action in
    start)
        check_root
        echo "Starting $service_name service..."
        systemctl start $service_name
        ;;
    stop)
        check_root
        echo "Stopping $service_name service..."
        systemctl stop $service_name
        ;;
    status)
        systemctl status $service_name
        ;;
    *)
        echo "Invalid action. Use: start, stop, or status"
        exit 1
        ;;
esac

exit 0