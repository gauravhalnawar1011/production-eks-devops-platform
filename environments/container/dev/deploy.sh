#!/bin/bash

set -e

ACTION=$1

KMS_DIR="../../security/kms"
ECR_DIR="./"

if [[ "$ACTION" != "apply" && "$ACTION" != "destroy" ]]; then
echo "Usage: ./platform.sh [apply|destroy]"
exit 1
fi

if [[ "$ACTION" == "apply" ]]; then


echo "====================================="
echo "Deploying Security (KMS)"
echo "====================================="

(
    cd "$KMS_DIR"

    terraform init
    terraform validate
    terraform plan -var-file=terraform.tfvars
    terraform apply -var-file=terraform.tfvars --auto-approve
)

echo "====================================="
echo "Deploying ECR"
echo "====================================="

(
    cd "$ECR_DIR"

    terraform init
    terraform validate
    terraform plan -var-file=terraform.tfvars
    terraform apply -var-file=terraform.tfvars --auto-approve
)

echo "====================================="
echo "Deployment Completed"
echo "====================================="


fi

if [[ "$ACTION" == "destroy" ]]; then


echo "====================================="
echo "Destroying ECR"
echo "====================================="

(
    cd "$ECR_DIR"

    terraform destroy -var-file=terraform.tfvars --auto-approve
)

echo "====================================="
echo "Destroying Security (KMS)"
echo "====================================="

(
    cd "$KMS_DIR"

    terraform destroy -var-file=terraform.tfvars --auto-approve
)

echo "====================================="
echo "Destroy Completed"
echo "====================================="


fi
