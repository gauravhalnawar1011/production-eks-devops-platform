#############################################################
# EKS Remote State
#############################################################

data "terraform_remote_state" "orchestration" {

  backend = "s3"

  config = {

    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"

    key = "orchestration/eks/dev/terraform.tfstate"

    region = "ap-south-1"

  }

}

#############################################################
# Admin Host Remote State
#############################################################

data "terraform_remote_state" "admin_host" {

  backend = "s3"

  config = {
    
    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"

    key = "infra/compute/ec2/dev/terraform.tfstate"

    region = "ap-south-1"
  }

}