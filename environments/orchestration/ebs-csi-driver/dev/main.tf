locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = var.managed_by
  }
}

module "ebs_csi_driver" {

  source = "../../../../modules/orchestration/ebs-csi-driver"

  environment = var.environment

  cluster_name = data.terraform_remote_state.eks.outputs.cluster_name

  oidc_provider_arn = data.terraform_remote_state.oidc.outputs.oidc_provider_arn

  oidc_provider_url = data.terraform_remote_state.oidc.outputs.oidc_provider_url

  common_tags = local.common_tags
}