data "terraform_remote_state" "oidc" {

  backend = "s3"

  config = {


    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"

    key = "orchestration/oidc/dev/terraform.tfstate"

    region = "ap-south-1"

  }
}




#################################################
# NETWORK REMOTE STATE
#################################################

data "terraform_remote_state" "network" {

  backend = "s3"

  config = {

    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"

    key = "infra/network/dev/terraform.tfstate"

    region = "ap-south-1"
  }
}


#################################################
# EKS STATE
#################################################

data "terraform_remote_state" "orchestration" {

  backend = "s3"

  config = {

    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"

    key = "orchestration/eks/dev/terraform.tfstate"

    region = "ap-south-1"
  }
}

