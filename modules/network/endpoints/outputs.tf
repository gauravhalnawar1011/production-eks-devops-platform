output "s3_endpoint_id" {
  value = aws_vpc_endpoint.s3.id
}

output "dynamodb_endpoint_id" {
  value = aws_vpc_endpoint.dynamodb.id
}

output "ecr_api_endpoint_id" {
  value = aws_vpc_endpoint.ecr_api.id
}

output "ecr_dkr_endpoint_id" {
  value = aws_vpc_endpoint.ecr_dkr.id
}

output "sts_endpoint_id" {
  value = aws_vpc_endpoint.sts.id
}

output "kms_endpoint_id" {
  value = aws_vpc_endpoint.kms.id
}

output "secretsmanager_endpoint_id" {
  value = aws_vpc_endpoint.secretsmanager.id
}

output "logs_endpoint_id" {
  value = aws_vpc_endpoint.logs.id
}

output "monitoring_endpoint_id" {
  value = aws_vpc_endpoint.monitoring.id
}

output "ssm_endpoint_id" {
  value = aws_vpc_endpoint.ssm.id
}