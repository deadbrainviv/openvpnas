#!/bin/bash

# Variables
ADMIN_USER="admin"
ADMIN_PASS="alphaomega@123" # Change this to a strong password

# Update and install prerequisites
apt update && apt upgrade -y
apt install -y curl wget net-tools ufw

# Install OpenVPN Access Server
sudo apt remove --purge openvpn-as -y
sudo rm -rf /usr/local/openvpn_as
sudo find / -type f -name '*.pyc' -delete
sudo apt update
sudo su
bash <(curl -fsS https://packages.openvpn.net/as/install.sh) --yes


# Setup admin password
/usr/local/openvpn_as/scripts/sacli --user $ADMIN_USER --key "type" --value "user_connect" UserPropPut
/usr/local/openvpn_as/scripts/sacli --user $ADMIN_USER --new_pass "$ADMIN_PASS" SetLocalPassword

# Open required firewall ports
ufw allow 943/tcp   # Web Interface
ufw allow 443/tcp   # HTTPS client connections
ufw allow 1194/udp  # VPN client connections
ufw --force enable

# Restart OpenVPN AS
systemctl restart openvpnas

# Retrieve server information
IP_ADDR=$(curl -s ifconfig.me)
echo "OpenVPN Access Server installation complete!"
echo "Access the web interface at: https://$IP_ADDR:943"
echo "Username: $ADMIN_USER"
echo "Password: $ADMIN_PASS"
