# Server Hardening Scripts

Automated hardening scripts for Debian 11/12/13 (and extensible to other systems).

## Quick Usage (after making repo public)

```bash
# One-click (recommended order)
curl -sL https://raw.githubusercontent.com/Annihilater/server-hardening-scripts/main/full-hardening.sh | bash

# Or individual scripts
curl -sL https://raw.githubusercontent.com/Annihilater/server-hardening-scripts/main/scripts/02-firewall-ufw.sh | bash
```

## Scripts

- `scripts/01-system-update.sh` - Update + unattended-upgrades
- `scripts/02-firewall-ufw.sh` - UFW with SSH allowed
- `scripts/03-fail2ban.sh` - Fail2ban for SSH
- `scripts/04-sysctl.sh` - Kernel network hardening
- `scripts/05-ssh-hardening.sh` - SSH: root key-only (prohibit-password)
- `full-hardening.sh` - Run all safe parts in order

**Note**: SSH script assumes you already have key-based login set up for root. It will disable password auth.

Make this repository public in Settings > General > Danger Zone for direct curl access.