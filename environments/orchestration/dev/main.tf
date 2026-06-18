locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = var.managed_by
  }
}

module "eks_cluster" {

  source = "../../../modules/orchestration/eks-cluster"

  #################################################
  # ENVIRONMENT
  #################################################

  environment = var.environment

  project_name = var.project_name

  #################################################
  # EKS
  #################################################

  cluster_name = var.cluster_name

  cluster_version = var.cluster_version

  #################################################
  # NETWORK
  #################################################

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  private_subnet_ids = data.terraform_remote_state.network.outputs.private_subnet_ids

  eks_cluster_sg_id = data.terraform_remote_state.network.outputs.eks_cluster_sg_id

  eks_node_sg_id = data.terraform_remote_state.network.outputs.eks_node_sg_id

  #################################################
  # KMS
  #################################################

  kms_key_arn = data.terraform_remote_state.security.outputs.kms_key_arn

  #################################################
  # NODE GROUP
  #################################################

  instance_types = var.instance_types

  desired_size = var.desired_size

  min_size = var.min_size

  max_size = var.max_size

  node_disk_size = var.node_disk_size

  #################################################
  # LOGGING
  #################################################

  cloudwatch_log_retention_days = var.cloudwatch_log_retention_days

  #################################################
  # BOTTLEROCKET
  #################################################

  ami_type = var.ami_type

  managed_by = var.managed_by
}