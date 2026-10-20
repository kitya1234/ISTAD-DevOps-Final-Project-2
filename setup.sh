#!/bin/bash

# ISTAD DevOps Project 2 - Automated Setup Script
# Clones Kubespray, installs dependencies, and runs cluster automation.

set -euo pipefail

echo "   ISTAD DevOps Project 2: Kubespray Kubernetes Automation       "

# Step 1: Install Python virtualenv prerequisites
echo "[1/4] Installing local prerequisites..."
python3 -m venv venv
source venv/bin/activate
pip install -U pip
pip install ansible bcrypt

# Step 2: Clone Kubespray if not already present
if [ ! -d "kubespray" ]; then
  echo "[2/4] Cloning Kubespray repository (v2.25.0)..."
  git clone --branch release-2.25 https://github.com/kubernetes-sigs/kubespray.git
  pip install -r kubespray/requirements.txt
fi

# Step 3: Run Node Prerequisites Playbook
echo "[3/4] Preparing nodes (Swap, Kernel Modules, sysctl)..."
ansible-playbook -i inventory/mycluster/hosts.yaml playbooks/01_kubespray_prereqs.yml

# Step 4: Run Kubespray Cluster Playbook
echo "[4/4] Running Kubespray HA Cluster Deployment..."
ansible-playbook -i inventory/mycluster/hosts.yaml kubespray/cluster.yml

# Step 5: Deploy Traefik, Headlamp, ArgoCD, and ReactJS App
echo "[5/5] Deploying Traefik Ingress, Headlamp, ArgoCD & React Pipeline..."
ansible-playbook -i inventory/mycluster/hosts.yaml playbooks/02_deploy_addons.yml

echo "[✓] Kubernetes Cluster and GitOps Pipeline Deployment Complete!"
