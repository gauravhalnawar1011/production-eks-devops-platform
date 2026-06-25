
#############################################################
# AWS MANAGED EKS CLUSTER SECURITY GROUP
#############################################################

#
# This Security Group is automatically created by Amazon EKS.
# Do NOT create another Cluster Security Group.
#
# It is exported through outputs.tf as:
#
# aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
#

#############################################################
# EKS WORKER NODE SECURITY GROUP
#############################################################

resource "aws_security_group" "eks_node" {

  name        = "${var.project_name}-${var.environment}-eks-node-sg"

  description = "Additional Security Group for EKS Worker Nodes"

  vpc_id = var.vpc_id

  tags = merge(

    local.common_tags,

    {

      Name = "${var.project_name}-${var.environment}-eks-node-sg"

      Module = "EKS"

    }

  )

}

#############################################################
# SELF COMMUNICATION
#############################################################

resource "aws_vpc_security_group_ingress_rule" "node_self" {

  security_group_id = aws_security_group.eks_node.id

  referenced_security_group_id = aws_security_group.eks_node.id

  ip_protocol = "-1"

  description = "Allow communication between worker nodes"

}

#############################################################
# CLUSTER -> WORKER
#############################################################

resource "aws_vpc_security_group_ingress_rule" "cluster_to_node" {

  security_group_id = aws_security_group.eks_node.id

  referenced_security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id

  ip_protocol = "-1"

  description = "Allow EKS Control Plane communication"

}

#############################################################
# WORKER -> CLUSTER
#############################################################

resource "aws_vpc_security_group_egress_rule" "node_to_cluster" {

  security_group_id = aws_security_group.eks_node.id

  referenced_security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id

  ip_protocol = "-1"

  description = "Allow communication to EKS Control Plane"

}

#############################################################
# INTERNET ACCESS
#############################################################

resource "aws_vpc_security_group_egress_rule" "internet" {

  security_group_id = aws_security_group.eks_node.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"

  description = "Allow outbound Internet access"

}

