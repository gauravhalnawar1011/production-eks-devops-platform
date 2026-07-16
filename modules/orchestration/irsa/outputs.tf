output "role_name" {

  description = "IAM Role Name"

  value = aws_iam_role.this.name

}

output "role_arn" {

  description = "IAM Role ARN"

  value = aws_iam_role.this.arn

}

output "role_unique_id" {

  description = "IAM Role Unique ID"

  value = aws_iam_role.this.unique_id

}