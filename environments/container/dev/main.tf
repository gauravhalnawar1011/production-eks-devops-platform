locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = var.managed_by
  }
}

#################################################
# ECR
#################################################

module "ecr" {

  source = "../../../modules/container/ecr"

  environment = var.environment

  project_name = var.project_name

  repository_name = var.repository_name

  kms_key_arn = data.terraform_remote_state.security.outputs.kms_key_arn

  common_tags = local.common_tags
}