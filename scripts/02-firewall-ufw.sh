#!/bin/bash
set -e
echo "=== Configuring UFW Firewall ==="
apt install -y ufw
ufw allow OpenSSH
ufw default deny incoming
ufw default allow outgoing
ufw --force enable
ufw status verbose
echo "UFW enabled with SSH allowed."
