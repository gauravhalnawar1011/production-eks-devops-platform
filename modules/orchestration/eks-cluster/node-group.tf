resource "aws_eks_node_group" "main" {

  cluster_name = aws_eks_cluster.main.name

  node_group_name = "${var.environment}-node-group"

  node_role_arn = aws_iam_role.eks_node.arn

  subnet_ids = var.private_subnet_ids

  ami_type = var.ami_type

  instance_types = var.instance_types

  capacity_type = "ON_DEMAND"



  launch_template {

    id = aws_launch_template.eks_nodes.id

    version = aws_launch_template.eks_nodes.latest_version
  }

  scaling_config {

    desired_size = var.desired_size

    min_size = var.min_size

    max_size = var.max_size
  }

  update_config {

    max_unavailable = 1
  }

  tags = local.common_tags
}