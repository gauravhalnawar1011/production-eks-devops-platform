terraform {

  backend "s3" {

    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"

    key = "infra/orchestration/irsa/dev/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

  }

}