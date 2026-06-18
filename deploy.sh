#!/bin/bash

set -e

PROJECT_NAME="production-eks-devops-platform"

mkdir -p ${PROJECT_NAME}

cd ${PROJECT_NAME}

# =========================

# ENVIRONMENTS

# =========================

mkdir -p environments/network/{dev,qa,uat,prod}
mkdir -p environments/container/{dev,qa,uat,prod}
mkdir -p environments/orchestration/{dev,qa,uat,prod}

# =========================

# NETWORK MODULES

# =========================

mkdir -p modules/network/vpc
mkdir -p modules/network/subnets
mkdir -p modules/network/internet-gateway
mkdir -p modules/network/nat-gateway
mkdir -p modules/network/route-tables
mkdir -p modules/network/security-groups

# =========================

# CONTAINER MODULES

# =========================

mkdir -p modules/container/ecr

# =========================

# ORCHESTRATION MODULES

# =========================

mkdir -p modules/orchestration/eks-cluster
mkdir -p modules/orchestration/eks-nodegroup
mkdir -p modules/orchestration/oidc-provider
mkdir -p modules/orchestration/irsa
mkdir -p modules/orchestration/aws-load-balancer-controller
mkdir -p modules/orchestration/metrics-server
mkdir -p modules/orchestration/argocd

# =========================

# NETWORK SERVICES

# =========================

mkdir -p modules/networking-services/acm
mkdir -p modules/networking-services/route53
mkdir -p modules/networking-services/external-dns

# =========================

# SECURITY

# =========================

mkdir -p modules/security/iam
mkdir -p modules/security/kms
mkdir -p modules/security/secrets-manager

# =========================

# OBSERVABILITY

# =========================

mkdir -p modules/observability/prometheus
mkdir -p modules/observability/grafana
mkdir -p modules/observability/alertmanager
mkdir -p modules/observability/loki

# =========================

# GITOPS

# =========================

mkdir -p gitops/apps/netflix-clone
mkdir -p gitops/apps/prometheus
mkdir -p gitops/apps/grafana
mkdir -p gitops/apps/alertmanager
mkdir -p gitops/apps/loki
mkdir -p gitops/apps/argocd

mkdir -p gitops/bootstrap

# =========================

# DOCUMENTATION

# =========================

mkdir -p docs/architecture
mkdir -p docs/screenshots
mkdir -p docs/diagrams

# =========================

# CI/CD

# =========================

mkdir -p .github/workflows

# =========================

# COMMON TERRAFORM FILES

# =========================

for env in environments/network/* environments/container/* environments/orchestration/*
do
touch "$env/main.tf"
touch "$env/variables.tf"
touch "$env/outputs.tf"
touch "$env/provider.tf"
touch "$env/backend.tf"
touch "$env/versions.tf"
touch "$env/terraform.tfvars"
done

echo "Platform structure created successfully."

tree .
