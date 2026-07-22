resource "aws_iam_policy" "this" {

  name        = local.policy_name
  description = "Policy for ArgoCD Image Updater to access Amazon ECR"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Action = [

          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:DescribeRepositories",
          "ecr:DescribeImages",
          "ecr:ListImages"

        ]

        Resource = "*"

      }

    ]

  })

  tags = var.tags

}