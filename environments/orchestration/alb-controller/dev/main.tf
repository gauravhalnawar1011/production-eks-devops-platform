locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = "Terraform"
  }
}

module "alb_controller" {

  source = "../../../../modules/orchestration/alb-controller"

  environment = var.environment

  project_name = var.project_name

  oidc_provider_arn = data.terraform_remote_state.oidc.outputs.oidc_provider_arn

  oidc_provider_url = data.terraform_remote_state.oidc.outputs.oidc_provider_url

  common_tags = local.common_tags
}