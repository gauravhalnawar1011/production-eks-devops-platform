output "secret_arn" {

  description = "Secrets Manager Secret ARN"

  value = aws_secretsmanager_secret.this.arn

}

output "secret_id" {

  description = "Secrets Manager Secret ID"

  value = aws_secretsmanager_secret.this.id

}

output "secret_name" {

  description = "Secrets Manager Secret Name"

  value = aws_secretsmanager_secret.this.name

}

