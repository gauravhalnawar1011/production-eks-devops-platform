locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = "Terraform"
  }
}

module "dns" {

  source = "../../../modules/dns"

  environment = var.environment

  domain_name = var.domain_name

  common_tags = local.common_tags
}