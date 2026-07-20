locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = "Terraform"

  }

}

module "backend_irsa" {

  source = "../../../../modules/orchestration/irsa"

  #################################################
  # PROJECT
  #################################################

  environment  = var.environment
  project_name = var.project_name

  #################################################
  # APPLICATION
  #################################################

  name = "backend"

  namespace = "backend"

  service_account_name = "backend"

  #################################################
  # OIDC
  #################################################

  oidc_provider_arn = data.terraform_remote_state.oidc.outputs.oidc_provider_arn

  oidc_provider_url = data.terraform_remote_state.oidc.outputs.oidc_provider_url

  #################################################
  # IAM POLICIES
  #################################################

  policy_arns = [

    "arn:aws:iam::aws:policy/SecretsManagerReadWrite"

  ]

  #################################################
  # TAGS
  #################################################

  common_tags = local.common_tags

}