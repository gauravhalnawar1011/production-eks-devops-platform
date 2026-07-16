locals {

  common_tags = {

    Environment = var.environment

    Project     = var.project_name

    ManagedBy   = "Terraform"

  }

}

module "secrets_manager" {

  source = "../../../../modules/security/secrets-manager"

  #################################################
  # Project
  #################################################

  environment  = var.environment

  project_name = var.project_name

  #################################################
  # Secret
  #################################################

  secret_name = var.secret_name

  description = var.description

  secret_values = var.secret_values

  #################################################
  # Encryption
  #################################################

  kms_key_arn = data.terraform_remote_state.kms.outputs.kms_key_arn

  #################################################
  # Optional Features
  #################################################

  create_resource_policy = var.create_resource_policy

  allowed_principal_arns = var.allowed_principal_arns

  enable_rotation = var.enable_rotation

  rotation_lambda_arn = var.rotation_lambda_arn

  rotation_days = var.rotation_days

  #################################################
  # Tags
  #################################################

  common_tags = local.common_tags

}