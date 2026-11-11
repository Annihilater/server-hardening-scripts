#!/bin/bash
set -e
echo "=== System Update & Unattended Upgrades ==="
apt update && apt full-upgrade -y
apt install -y unattended-upgrades apt-listchanges needrestart
dpkg-reconfigure -plow unattended-upgrades || true
echo "Done."
