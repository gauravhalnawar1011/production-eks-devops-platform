locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = "Terraform"

  }

}

module "backend_service_account" {

  source = "../../../../modules/orchestration/kubernetes-service-account"

  namespace = "backend"

  service_account_name = "backend"

  role_arn = data.terraform_remote_state.irsa.outputs.role_arn

  labels = {

    app = "backend"

    environment = var.environment

  }

}