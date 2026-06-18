#################################################
# ECR REPOSITORY
#################################################

resource "aws_ecr_repository" "this" {

  name = var.repository_name

  image_tag_mutability = var.image_tag_mutability

  force_delete = var.force_delete

  encryption_configuration {

    encryption_type = "KMS"

    kms_key = var.kms_key_arn
  }

  image_scanning_configuration {

    scan_on_push = true
  }

  tags = merge(

    var.common_tags,

    {
      Name = var.repository_name
    }
  )
}

#################################################
# LIFECYCLE POLICY
#################################################

resource "aws_ecr_lifecycle_policy" "this" {

  repository = aws_ecr_repository.this.name

  policy = jsonencode({

    rules = [

      {

        rulePriority = 1

        description = "Keep last 20 images"

        selection = {

          tagStatus = "any"

          countType = "imageCountMoreThan"

          countNumber = 20
        }

        action = {

          type = "expire"
        }
      }
    ]
  })
}