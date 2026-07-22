terraform {

  backend "s3" {

    bucket = "space9-remote-state-239713807106"

    key = "dns/global/hostedzone/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

    use_lockfile = false
  }
}