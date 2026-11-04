#############################################################
# IRSA
#############################################################

data "terraform_remote_state" "irsa" {

  backend = "s3"

  config = {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "infra/orchestration/irsa/dev/terraform.tfstate"

    region = "ap-south-1"

  }

}

#############################################################
# EKS
#############################################################

data "terraform_remote_state" "eks" {

  backend = "s3"

  config = {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "orchestration/eks/dev/terraform.tfstate"

    region = "ap-south-1"

  }

}