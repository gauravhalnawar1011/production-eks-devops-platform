resource "aws_cloudwatch_log_group" "eks" {

  name = "/aws/eks/${var.cluster_name}/cluster"

  retention_in_days = var.cloudwatch_log_retention_days

  kms_key_id = var.kms_key_arn

  tags = local.common_tags
}