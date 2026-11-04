#################################################
# SECURITY REMOTE STATE
#################################################

data "terraform_remote_state" "security" {

  backend = "s3"

  config = {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "infra/security/kms/dev/terraform.tfstate"

    region = "ap-south-1"
  }
}