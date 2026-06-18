#################################################
# SECURITY REMOTE STATE
#################################################

data "terraform_remote_state" "security" {

  backend = "s3"

  config = {

    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"

    key = "infra/security/kms/dev/terraform.tfstate"

    region = "ap-south-1"
  }
}