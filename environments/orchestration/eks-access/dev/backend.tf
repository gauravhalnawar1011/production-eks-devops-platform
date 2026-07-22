terraform {

  backend "s3" {

    bucket = "space9-remote-state-239713807106"

    key = "infra/orchestration/eks-access/dev/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

  }

}