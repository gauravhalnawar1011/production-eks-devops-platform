#################################################
# NETWORK REMOTE STATE
#################################################

data "terraform_remote_state" "network" {

  backend = "s3"

  config = {

    bucket = "space9-remote-state-239713807106"

    key = "infra/network/dev/terraform.tfstate"

    region = "ap-south-1"
  }
}


data "terraform_remote_state" "security" {

  backend = "s3"

  config = {

    bucket = "space9-remote-state-239713807106"

    key = "infra/security/kms/dev/terraform.tfstate"

    region = "ap-south-1"
  }

}