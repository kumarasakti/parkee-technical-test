#!/bin/bash

log_dir="/var/log/system-updates"
log_file="${log_dir}/$(date +'%Y-%m-%d').log"
lock_file="/tmp/system-updates.lock"

red="\033[0;31m"
green="\033[0;32m"
yellow="\033[0;33m"
nc="\033[0m"

log_message() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local message="[$timestamp] $1"
    echo -e "$message" | tee -a "$log_file"
}


error_exit() {
    log_message "${red}ERROR: $1${nc}"
    rm -rf "$lock_file"
    exit 1
}

detect_package_manager() {
    if command -v apt &>/dev/null; then
        echo "apt"
    elif command -v dnf &>/dev/null; then
        echo "dnf"
    elif command -v yum &>/dev/null; then
        echo "yum"
    elif command -v pacman &>/dev/null; then
        echo "pacman"
    elif command -v zypper &>/dev/null; then
        echo "zypper"
    else
        error_exit "No supported package manager found"
    fi
}

update_packages_lists() {
    local pkg_manager=$1
    log_message "${yellow}Updating package lists...${nc}"

    case $pkg_manager in
        apt)
            apt update 2>&1 | tee -a "$log_file"
            ;;
        dnf|yum)
            $pkg_manager check-update 2>&1 | tee -a "$log_file"
            ;;
        pacman)
            pacman -Sy 2>&1 | tee -a "$log_file"
            ;;
        zypper)
            zypper refresh 2>&1 | tee -a "$log_file"
            ;;
    esac
}

perform_upgrade() {
    local pkg_manager=$1
    log_message "${yellow}Upgrading packages...${nc}"

    case $pkg_manager in
        apt)
            DEBIAN_FRONTEND=noninteractive apt upgrade -y 2>&1 | tee -a "$log_file"
            ;;
        dnf|yum)
            $pkg_manager upgrade -y 2>&1 | tee -a "$log_file"
            ;;
        pacman)
            pacman -Syu --noconfirm 2>&1 | tee -a "$log_file"
            ;;
        zypper)
            zypper update -y 2>&1 | tee -a "$log_file"
            ;;
    esac
}

cleanup() {
    local pkg_manager=$1
    log_message "${yellow}Cleaning up...${nc}"

    case $pkg_manager in
        apt)
            apt autoremove -y 2>&1 | tee -a "$log_file"
            ;;
        dnf|yum)
            $pkg_manager autoremove -y 2>&1 | tee -a "$log_file"
            ;;
        pacman)
            pacman -Sc --noconfirm 2>&1 | tee -a "$log_file"
            ;;
        zypper)
            zypper clean 2>&1 | tee -a "$log_file"
            ;;
    esac
}

main() {
    if [ "$EUID" -ne 0 ]; then
        error_exit "This script must be run as root"
    fi

    mkdir -p "$log_dir"

    if [ -f "$lock_file" ]; then
        error_exit "Another update process is running. Exiting..."
    fi

    touch "$lock_file"

    trap 'rm -rf "$lock_file"' EXIT

    log_message "${green}Starting system update...${nc}"
    log_message "System Information:"
    uname -a >> "$log_file"

    pkg_manager=$(detect_package_manager)
    log_message "Detected package manager: $pkg_manager"

    update_packages_lists "$pkg_manager"
    perform_upgrade "$pkg_manager"
    cleanup "$pkg_manager"

    log_message "${green}System update completed successfully${nc}"

    find "$log_dir" -type f -mtime +7 -exec gzip {} \;
}

main