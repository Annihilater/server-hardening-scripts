#!/bin/bash
set -e
echo "=== Installing Fail2ban ==="
apt install -y fail2ban
cat > /etc/fail2ban/jail.d/sshd.local << 'EOF'
[sshd]
enabled = true
port = ssh
backend = systemd
maxretry = 3
findtime = 10m
bantime = 1h
EOF
systemctl enable --now fail2ban
fail2ban-client status sshd || true
echo "Fail2ban configured."
