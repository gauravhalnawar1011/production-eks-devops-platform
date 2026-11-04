terraform {

  backend "s3" {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "infra/orchestration/eks-access/dev/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

  }

}