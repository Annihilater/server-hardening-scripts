#!/bin/bash
set -e
echo "=== SSH Hardening (root key-only) ==="
echo "WARNING: Ensure SSH key login works before running this!"
cat > /etc/ssh/sshd_config.d/00-hardening.conf << 'EOF'
PermitRootLogin prohibit-password
PasswordAuthentication no
KbdInteractiveAuthentication no
PubkeyAuthentication yes
AuthenticationMethods publickey
MaxAuthTries 3
LoginGraceTime 30
X11Forwarding no
EOF
sshd -t && systemctl reload ssh
echo "SSH hardened. Test a new connection immediately."
