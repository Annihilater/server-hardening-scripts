#!/bin/bash
set -e
BASE_URL="https://raw.githubusercontent.com/Annihilater/server-hardening-scripts/main/scripts"
echo "Running full safe hardening (excludes SSH by default for safety)..."
for script in 01-system-update.sh 02-firewall-ufw.sh 03-fail2ban.sh 04-sysctl.sh; do
  echo "Executing $script..."
  curl -sL "$BASE_URL/$script" | bash
done
echo "Done. Run 05-ssh-hardening.sh separately after confirming key login."
