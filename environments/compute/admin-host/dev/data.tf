#############################################################
# Network Remote State
#############################################################

data "terraform_remote_state" "network" {

  backend = "s3"

  config = {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "infra/network/dev/terraform.tfstate"

    region = "ap-south-1"

  }

}