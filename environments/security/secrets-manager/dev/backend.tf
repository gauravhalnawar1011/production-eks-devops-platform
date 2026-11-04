terraform {

  backend "s3" {

    bucket         = "terraform-remote-backend-july-batch-fctp-v5"

    key            = "dev/security/secrets-manager/terraform.tfstate"

    region         = "ap-south-1"

    encrypt        = true

    use_lockfile   = true

  }

}