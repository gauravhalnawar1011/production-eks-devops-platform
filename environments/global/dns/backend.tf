terraform {

  backend "s3" {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "dns/global/hostedzone/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

    use_lockfile = false
  }
}