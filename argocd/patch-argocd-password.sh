#!/bin/bash
# ==============================================================================
# Script to set custom ArgoCD admin password using bcrypt
# ==============================================================================
set -euo pipefail

NEW_PASSWORD="${1:-DevOps@Argo2026!}"

echo "[*] Generating bcrypt hash for new ArgoCD password..."
# Generate bcrypt hash using python
BCRYPT_HASH=$(python3 -c "import bcrypt; print(bcrypt.hashpw(b'$NEW_PASSWORD', bcrypt.gensalt(10)).decode('utf-8'))")
MTIME=$(date -u +%Y-%m-%dT%H:%M:%SZ)

echo "[*] Patching argocd-secret in namespace argocd..."
kubectl -n argocd patch secret argocd-secret   -p "{\"stringData\": {\"admin.password\": \"$BCRYPT_HASH\", \"admin.passwordMtime\": \"$MTIME\"}}"

echo "[✓] Successfully updated ArgoCD admin password!"
echo "    - Domain: https://argocd.devops.local"
echo "    - Username: admin"
echo "    - Password: $NEW_PASSWORD"
