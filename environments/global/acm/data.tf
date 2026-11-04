#################################################
# DNS REMOTE STATE
#################################################

data "terraform_remote_state" "dns" {

  backend = "s3"

  config = {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "dns/global/hostedzone/terraform.tfstate"

    region = "ap-south-1"
  }
}