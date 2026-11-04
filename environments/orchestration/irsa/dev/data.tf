#############################################################
# OIDC Remote State
#############################################################

data "terraform_remote_state" "oidc" {

  backend = "s3"

  config = {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "orchestration/oidc/dev/terraform.tfstate"

    region = "ap-south-1"

  }

}