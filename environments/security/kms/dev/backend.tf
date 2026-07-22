terraform {

  backend "s3" {

    bucket = "space9-remote-state-239713807106"

    key = "infra/security/kms/dev/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

    use_lockfile = false
  }
}