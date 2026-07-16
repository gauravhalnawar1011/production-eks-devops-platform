#############################################################
# Secret Resource Policy
#############################################################

resource "aws_secretsmanager_secret_policy" "this" {

  count = var.create_resource_policy ? 1 : 0

  secret_arn = aws_secretsmanager_secret.this.arn

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "AllowSecretAccess"

        Effect = "Allow"

        Principal = {

          AWS = var.allowed_principal_arns

        }

        Action = [

          "secretsmanager:GetSecretValue",

          "secretsmanager:DescribeSecret"

        ]

        Resource = aws_secretsmanager_secret.this.arn

      }

    ]

  })

}