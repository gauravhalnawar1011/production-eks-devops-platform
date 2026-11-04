terraform {

  backend "s3" {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "security/github-oidc/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

    use_lockfile = false
  }
}