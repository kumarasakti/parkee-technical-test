#!/bin/bash

error_message() {
    echo -e "\e[31mError: $1\e[0m" >&2
}

success_message() {
    echo -e "\e[32m$1\e[0m"
}

validate_directory() {
    local dir="$1"

    if [[ -z "$dir" ]]; then
        error_message "Directory is required"
        echo "Usage: $0 <directory_path>"
        exit 1
    fi
}

create_directory() {
    local dir="$1"

    if [[ ! -d "$dir" ]]; then
        mkdir -p "$dir" || {
            error_message "Failed to create directory: $dir"
            exit 1
        }
        success_message "Directory created successfully at: $dir"
    fi
}

generate_ssh_keys() {
    local dir="$1"
    local key_file="$dir/id_ed25519"
    
    # Generate Ed25519 SSH key pair
    ssh-keygen -t ed25519 -f "$key_file" -N "" -C "$(whoami)@$(hostname)-$(date +%Y%m%d)" || {
        error_message "Failed to generate SSH keys"
        exit 1
    }
    
    # Set proper permissions
    chmod 700 "$dir"
    chmod 600 "$key_file"
    chmod 644 "$key_file.pub"
    
    success_message "\nSSH keys generated successfully:"
    echo "Private key: $key_file"
    echo "Public key: $key_file.pub"
    
    # Display public key content
    echo -e "\nPublic key:"
    cat "$key_file.pub"
}


main() {
    local target_dir="$1"

    validate_directory "$target_dir"

    create_directory "$target_dir"

    generate_ssh_keys "$target_dir"

}

main "$1"