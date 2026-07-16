aws_region  = "ap-south-1"

environment = "dev"

project_name = "production-eks-platform"

secret_name = "/production-eks-platform/dev/rds/postgres"

description = "PostgreSQL credentials"

secret_values = {

  username = "postgres"

  password = "ChangeMe123!"

  database = "studentdb"

  host     = "production-eks-platform-dev-postgres.xxxxxx.ap-south-1.rds.amazonaws.com"

  port     = "5432"

}

create_resource_policy = false

enable_rotation = false