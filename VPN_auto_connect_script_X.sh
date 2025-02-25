#!/bin/bash

# Set the path to your OpenVPN configuration file
VPN_CONFIG="/path/to/your/vpn/config.ovpn"

# Set the path to your credentials file (optional)
CREDENTIALS="/path/to/your/credentials.txt"

# Ensure OpenVPN is installed
if ! command -v openvpn &> /dev/null; then
    echo "OpenVPN is not installed. Please install it first."
    exit 1
fi

# Check if VPN is already running
if pgrep -x "openvpn" > /dev/null; then
    echo "VPN is already running."
    exit 0
fi

# Start OpenVPN connection
echo "Starting OpenVPN..."
sudo openvpn --config "$VPN_CONFIG" --auth-user-pass "$CREDENTIALS" --daemon

# Check if OpenVPN started successfully
sleep 5
if pgrep -x "openvpn" > /dev/null; then
    echo "VPN connected successfully!"
else
    echo "Failed to start VPN."
    exit 1
fi
