terraform {

  backend "s3" {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"
    key            = "security/argocd-image-updater/dev/terraform.tfstate"
    region         = "ap-south-1"

    encrypt = true

    use_lockfile = false
  }
}