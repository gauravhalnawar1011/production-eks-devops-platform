data "terraform_remote_state" "oidc" {

  backend = "s3"

  config = {


    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"

    key = "orchestration/oidc/dev/terraform.tfstate"

    region = "ap-south-1"

  }
}


