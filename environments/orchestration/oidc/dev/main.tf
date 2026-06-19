locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = var.managed_by
  }
}

module "oidc" {

  source = "../../../../modules/orchestration/oidc"

  environment = var.environment

  oidc_issuer_url = data.terraform_remote_state.eks.outputs.cluster_oidc_issuer_url

  common_tags = local.common_tags
}