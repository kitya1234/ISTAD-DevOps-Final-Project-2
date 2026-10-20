# ISTAD DevOps Final Project - Project 2: High-Availability Kubernetes Cluster with Kubespray & GitOps

This repository automates the provisioning and configuration of a High-Availability Kubernetes cluster using **Kubespray** and Ansible, featuring:
- **1 Control Plane (Master Node)** + **3 Worker Nodes**
- **Traefik v3 Ingress Controller** replacing default NGINX
- **Headlamp Dashboard** with domain name and automated RBAC token authentication
- **ArgoCD GitOps** with domain name and custom password automation
- **ReactJS CI/CD GitOps Pipeline** with Docker multi-stage build, Jenkinsfile, and ArgoCD sync

---

## Quick Start

```bash
chmod +x setup.sh argocd/patch-argocd-password.sh
./setup.sh
```

See **PROJECT_2_KUBERNETES_GUIDE.md** for complete documentation and architecture details.
