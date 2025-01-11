#!/bin/bash

echo "Starting firewall configuration..."


echo "Flushing existing firewall rules..."
iptables -F
iptables -X
echo "✓ Existing rules flushed"

echo "Setting default policies..."
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
echo "✓ Default policies set: INPUT/FORWARD -> DROP, OUTPUT -> ACCEPT"

echo "Configuring loopback interface..."
iptables -A INPUT -i lo -j ACCEPT
echo "✓ Loopback interface configured"

echo "Allowing established and related connections..."
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
echo "✓ Established and related connections allowed"

echo "Opening port 22 for SSH..."
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
echo "✓ SSH port (22) opened"

echo "Opening port 80 for HTTP..."
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
echo "✓ HTTP port (80) opened"

echo "Opening port 443 for HTTPS..."
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
echo "✓ HTTPS port (443) opened"

echo "Saving firewall rules..."
if iptables-save > /etc/iptables/rules.v4; then
    echo "✓ Firewall rules saved successfully to /etc/iptables/rules.v4"
else
    echo "⨯ Failed to save firewall rules"
    exit 1
fi

echo -e "\nFirewall configuration completed successfully!"
echo "Summary of open ports:"
echo "- SSH (22)"
echo "- HTTP (80)"
echo "- HTTPS (443)"