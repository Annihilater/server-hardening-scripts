#!/bin/bash
set -euo pipefail

echo "=== System Update + Unattended Upgrades (non-interactive) ==="

# Force non-interactive mode
export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
export NEEDRESTART_MODE=a

# Pre-answer unattended-upgrades to enable auto updates
echo "unattended-upgrades unattended-upgrades/enable_auto_updates boolean true" | debconf-set-selections

apt update

# Upgrade while keeping local modified configs (safer for SSH etc.)
apt -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    full-upgrade -y

apt install -y unattended-upgrades apt-listchanges needrestart

# Ensure auto-upgrades is enabled
cat > /etc/apt/apt.conf.d/20auto-upgrades << 'EOF'
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
EOF

# Non-interactive reconfigure
dpkg-reconfigure -f noninteractive unattended-upgrades || true

echo "System update completed (non-interactive)."
