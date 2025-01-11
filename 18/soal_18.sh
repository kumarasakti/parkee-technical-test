#!/bin/bash

cat << EOF | sudo tee /etc/netplan/01-network-config.yaml
network:
    version: 2
    renderer: networkd
    ethernets:
        eth0:
            addresses:
                - 192.168.1.100/24
            gateway4: 192.168.1.1
            nameservers:
                addresses: [8.8.8.8, 8.8.4.4]
EOF

sudo netplan apply

echo "Network configuration has been applied"
echo "----------------------------------------"
echo "Network Summary:"
echo "IP Address: 192.168.1.100"
echo "Gateway   : 192.168.1.1"
echo "DNS       : 8.8.8.8, 8.8.4.4"
echo "----------------------------------------"