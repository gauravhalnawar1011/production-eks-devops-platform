\#!/bin/bash

set -euo pipefail

#############################################################
# PLATFORM MODULES
#############################################################

# Networking
NETWORK="network/dev"

# Security
KMS="security/kms/dev"
SECRETS_MANAGER="security/secrets-manager/dev"

# Container Registry
ECR="container/dev"

# Global Services
# DNS="global/dns"   # Never destroy if managed manually (e.g. GoDaddy)
ACM="global/acm"
ACM_GLOBAL="global/acm-global"

# Compute
ADMIN_HOST="compute/admin-host/dev"

# EKS
EKS="orchestration/dev"
OIDC="orchestration/oidc/dev"
EBS_CSI="orchestration/ebs-csi-driver/dev"
ALB_CONTROLLER="orchestration/alb-controller/dev"
EKS_ACCESS="orchestration/eks-access/dev"
IRSA="orchestration/irsa/dev"
SERVICE_ACCOUNT="orchestration/kubernetes-service-account/dev"

# Database
RDS="database/rds/dev"

# Frontend
WEB_DEV="frontend/dev"

#############################################################
# Helper Function
#############################################################

run_module() {

    local action="$1"
    local module="$2"

    echo
    echo "============================================================"
    echo " ${action^^} : ${module}"
    echo "============================================================"
    echo

    cd "$module"

    chmod +x deploy.sh

    ./deploy.sh "$action"

    cd - >/dev/null
}

#############################################################
# Apply Infrastructure
#############################################################

apply() {

    # run_module apply "$DNS"

    run_module apply "$NETWORK"

    run_module apply "$KMS"

    run_module apply "$ACM"
    run_module apply "$ACM_GLOBAL"

    run_module apply "$ECR"

    run_module apply "$EKS"

    run_module apply "$OIDC"

    run_module apply "$EBS_CSI"

    run_module apply "$ALB_CONTROLLER"

    run_module apply "$RDS"

    run_module apply "$SECRETS_MANAGER"

    run_module apply "$ADMIN_HOST"

    run_module apply "$EKS_ACCESS"

    run_module apply "$IRSA"

    run_module apply "$SERVICE_ACCOUNT"

    run_module apply "$WEB_DEV"

    echo
    echo "============================================================"
    echo " Production EKS Platform Deployment Completed Successfully"
    echo "============================================================"
}

#############################################################
# Destroy Infrastructure
#############################################################

destroy() {

    run_module destroy "$WEB_DEV"

    run_module destroy "$SERVICE_ACCOUNT"

    run_module destroy "$IRSA"

    run_module destroy "$EKS_ACCESS"

    run_module destroy "$ADMIN_HOST"

    run_module destroy "$SECRETS_MANAGER"

    run_module destroy "$RDS"

    run_module destroy "$ALB_CONTROLLER"

    run_module destroy "$EBS_CSI"

    run_module destroy "$OIDC"

    run_module destroy "$EKS"

    run_module destroy "$ECR"

    run_module destroy "$ACM_GLOBAL"

    run_module destroy "$ACM"

    run_module destroy "$KMS"

    run_module destroy "$NETWORK"

    # run_module destroy "$DNS"

    echo
    echo "============================================================"
    echo " Production EKS Platform Destroy Completed Successfully"
    echo "============================================================"
}

#############################################################
# Main
#############################################################

case "${1:-}" in

    apply)
        apply
        ;;

    destroy)
        destroy
        ;;

    *)
        echo
        echo "Usage:"
        echo "  ./deploy.sh apply"
        echo "  ./deploy.sh destroy"
        echo
        exit 1
        ;;
esac