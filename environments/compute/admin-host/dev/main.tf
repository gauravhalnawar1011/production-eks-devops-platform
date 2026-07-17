locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = "Terraform"

  }

}

module "admin_host" {

  source = "../../../../modules/compute/admin-host"

  #############################################################
  # Project
  #############################################################

  environment = var.environment

  project_name = var.project_name

  aws_region = var.aws_region

  #############################################################
  # Network
  #############################################################

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id


  public_subnet_id = data.terraform_remote_state.network.outputs.public_subnet_ids[0]

  #############################################################
  # EC2
  #############################################################

  instance_type = "m7i-flex.large"

  root_volume_size = 30

  key_name = var.key_name

  #############################################################
  # Security
  #############################################################

  allowed_ssh_cidr = "0.0.0.0/0"

  #############################################################
  # Tags
  #############################################################

  tags = local.common_tags

}
