terraform {

  backend "s3" {

    bucket = "space9-remote-state-239713807106"

    key = "frontend/acm/global/ssl_tls_cert/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

    use_lockfile = false
  }
}