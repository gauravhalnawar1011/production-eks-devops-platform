terraform {

  backend "s3" {

    bucket = "terraform-remote-backend-july-batch-fctp-v5"

    key = "orchestration/eks/alb_controller/dev/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

  }
}
