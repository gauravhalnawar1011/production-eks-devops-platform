#############################################################
# EC2 Assume Role Policy
#############################################################

data "aws_iam_policy_document" "ec2_assume_role" {

  statement {

    sid = "EC2AssumeRole"

    effect = "Allow"

    actions = [

      "sts:AssumeRole"

    ]

    principals {

      type = "Service"

      identifiers = [

        "ec2.amazonaws.com"

      ]

    }

  }

}

#############################################################
# IAM Role
#############################################################

resource "aws_iam_role" "admin_host" {

  name = "${local.name_prefix}-admin-host-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = local.common_tags

}

#############################################################
# Amazon SSM
#############################################################

resource "aws_iam_role_policy_attachment" "ssm" {

  role = aws_iam_role.admin_host.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}

#############################################################
# Read ECR Images
#############################################################

resource "aws_iam_role_policy_attachment" "ecr" {

  role = aws_iam_role.admin_host.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

}

#############################################################
# CloudWatch Agent
#############################################################

resource "aws_iam_role_policy_attachment" "cloudwatch" {

  role = aws_iam_role.admin_host.name

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"

}

#############################################################
# Read Only Access
#############################################################

resource "aws_iam_role_policy_attachment" "readonly" {

  role = aws_iam_role.admin_host.name

  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"

}

#############################################################
# EKS Describe Permissions
#############################################################

resource "aws_iam_role_policy_attachment" "eks" {

  role = aws_iam_role.admin_host.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}

#############################################################
# Optional Administrator Access
#
# ONLY ENABLE FOR LABS / TRAINING
#
# resource "aws_iam_role_policy_attachment" "admin" {
#
#   role       = aws_iam_role.admin_host.name
#
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
#
# }
#############################################################