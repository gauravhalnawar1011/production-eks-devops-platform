resource "aws_eks_cluster" "main" {

  name     = var.cluster_name
  version  = var.cluster_version
  role_arn = aws_iam_role.eks_cluster.arn

  access_config {

    authentication_mode = "API_AND_CONFIG_MAP"

    bootstrap_cluster_creator_admin_permissions = true
  }

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  encryption_config {
    provider {
      key_arn = var.kms_key_arn
    }

    resources = ["secrets"]
  }

  vpc_config {

    endpoint_private_access = true
    endpoint_public_access  = true

    security_group_ids = [
      var.eks_cluster_sg_id
    ]

    subnet_ids = var.private_subnet_ids
  }

  depends_on = [
    aws_cloudwatch_log_group.eks,
    aws_iam_role_policy_attachment.cluster_policy,
    aws_iam_role_policy_attachment.vpc_controller
  ]

  tags = local.common_tags
}