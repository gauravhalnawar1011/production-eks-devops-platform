#################################################
# DNS REMOTE STATE
#################################################

data "terraform_remote_state" "dns" {

  backend = "s3"

  config = {

    bucket = "space9-remote-state-239713807106"

    key = "dns/global/hostedzone/terraform.tfstate"

    region = "ap-south-1"
  }
}