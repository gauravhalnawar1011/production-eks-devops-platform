#######################################################
# Route53 Hosted Zone
#######################################################

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

#######################################################
# ACM Remote State
#######################################################

data "terraform_remote_state" "acm_global" {

  backend = "s3"

  config = {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "frontend/acm/global/ssl_tls_cert/terraform.tfstate"

    region = "ap-south-1"

  }

}