locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = "Terraform"
  }
}
module "alb_controller" {

  source = "../../../../modules/orchestration/alb-controller"

  providers = {
    aws        = aws
    kubernetes = kubernetes
    helm       = helm
  }
  #################################################
  # PROJECT
  #################################################

  environment  = var.environment
  project_name = var.project_name

  #################################################
  # OIDC
  #################################################

  oidc_provider_arn = data.terraform_remote_state.oidc.outputs.oidc_provider_arn
  oidc_provider_url = data.terraform_remote_state.oidc.outputs.oidc_provider_url

  #################################################
  # EKS
  #################################################

  cluster_name = data.terraform_remote_state.orchestration.outputs.cluster_name

  #################################################
  # NETWORK
  #################################################

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  #################################################
  # AWS
  #################################################

  aws_region = var.aws_region

  #################################################
  # TAGS
  #################################################

  common_tags = local.common_tags
}