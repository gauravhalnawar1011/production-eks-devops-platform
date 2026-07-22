#############################################################
# IRSA
#############################################################

data "terraform_remote_state" "irsa" {

  backend = "s3"

  config = {

    bucket = "space9-remote-state-239713807106"

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

    bucket = "space9-remote-state-239713807106"

    key = "orchestration/eks/dev/terraform.tfstate"

    region = "ap-south-1"

  }

}