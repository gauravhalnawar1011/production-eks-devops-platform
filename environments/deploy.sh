#!/bin/bash

set -e

#################################################

# DEPLOYMENT ORDER

#################################################

NETWORK="network/dev"
KMS="security/kms/dev"
ECR="container/dev"
#DNS="global/dns" # dont destroy it otherwise you need to update the domain in my case it godaddy 
ACM="global/acm"
EKS="orchestration/dev"
OIDC="orchestration/oidc/dev"
EBS_CSI="orchestration/ebs-csi-driver/dev"
ALB_CONTROLLER="orchestration/alb-controller/dev"

#################################################

# FUNCTION

#################################################

run_module() {


local action=$1
local module_path=$2

echo ""
echo "=================================================="
echo "$action : $module_path"
echo "=================================================="
echo ""

cd "$module_path"

chmod +x deploy.sh

./deploy.sh "$action"

cd - >/dev/null


}

#################################################

# APPLY

#################################################

apply() {

# run_module apply "$DNS"

run_module apply "$ACM"


run_module apply "$NETWORK"

run_module apply "$KMS"

run_module apply "$ECR"

run_module apply "$EKS"

run_module apply "$OIDC"

run_module apply "$EBS_CSI"

run_module apply "$ALB_CONTROLLER"

echo ""
echo "======================================"
echo "Platform Deployment Completed"
echo "======================================"


}

#################################################

# DESTROY

#################################################

destroy() {


run_module destroy "$ALB_CONTROLLER"

run_module destroy "$EBS_CSI"

run_module destroy "$OIDC"

run_module destroy "$EKS"

run_module destroy "$ECR"

run_module destroy "$KMS"

run_module destroy "$NETWORK"

# run_module destroy "$DNS"

run_module destroy "$ACM"



echo ""
echo "======================================"
echo "Platform Destroy Completed"
echo "======================================"


}

#################################################

# MAIN

#################################################

case "$1" in


apply)
    apply
    ;;

destroy)
    destroy
    ;;

*)
    echo ""
    echo "Usage:"
    echo "./deploy.sh apply"
    echo "./deploy.sh destroy"
    echo ""
    exit 1
    ;;


esac