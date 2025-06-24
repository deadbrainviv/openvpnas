# OpenVPN Server with Web Management Interface

## Overview

This repository provides a simple and secure way to deploy an OpenVPN server complete with a user-friendly web-based administration interface for managing VPN accounts and connections. Suitable for both local Ubuntu installations and cloud environments such as AWS.

## Features

* Automated installation of OpenVPN Access Server
* Secure web interface for managing VPN users and connections
* Easy-to-configure administrator credentials
* Built-in firewall setup with UFW

## Installation

### Requirements

* Ubuntu 20.04 LTS or newer
* Root access or sudo privileges

### Quick Start

1. **Clone the Repository:**

```bash
git clone https://github.com/deadbrainviv/openvpnas.git
cd openvpn-web-admin
```

2. **Edit Admin Credentials:**
   Update the admin credentials (`ADMIN_USER` and `ADMIN_PASS`) in the `install_openvpn_web.sh` script:

```bash
vim install_openvpn_web.sh
```

3. **Run the Installation Script:**

```bash
chmod +x install_openvpn_web.sh
sudo ./install_openvpn_web.sh
```

## Accessing the Web Interface

After installation, access the administration interface via:

```bash
https://YOUR_SERVER_IP:943
```

Use your configured admin username and password to log in.

## Security Recommendations

* Always use a strong, unique password for admin credentials.
* Restrict web interface access via firewall or AWS Security Groups to known IP addresses.
* Regularly update your server packages to apply security patches.

## License

This project is licensed under the MIT License.
