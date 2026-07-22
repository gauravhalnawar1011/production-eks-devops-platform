data "terraform_remote_state" "github_oidc" {

  backend = "s3"

  config = {
    bucket = "space9-remote-state-239713807106"

    key = "orchestration/oidc/dev/terraform.tfstate"

    region = "ap-south-1"

  }

}

module "argocd_image_updater_irsa" {

  source = "../../../../modules/security/argocd-image-updater-irsa"

  environment = var.environment

  project_name = var.project_name

  oidc_provider_arn = data.terraform_remote_state.github_oidc.outputs.oidc_provider_arn

  oidc_provider_url = data.terraform_remote_state.github_oidc.outputs.oidc_provider_url

  namespace = "argocd"

  service_account_name = "argocd-image-updater"

  tags = var.tags

}