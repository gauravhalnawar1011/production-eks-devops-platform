data "terraform_remote_state" "kms" {

  backend = "s3"

  config = {

    bucket = "space9-remote-state-239713807106"

    key = "infra/security/kms/dev/terraform.tfstate"

    region = "ap-south-1"

  }

}