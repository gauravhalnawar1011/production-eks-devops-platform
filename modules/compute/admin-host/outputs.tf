#############################################################
# EC2
#############################################################

output "instance_id" {
  description = "Admin Host EC2 Instance ID"
  value       = aws_instance.admin_host.id
}

output "instance_arn" {
  description = "Admin Host EC2 ARN"
  value       = aws_instance.admin_host.arn
}

output "public_ip" {
  description = "Public IP Address"
  value       = aws_instance.admin_host.public_ip
}

output "private_ip" {
  description = "Private IP Address"
  value       = aws_instance.admin_host.private_ip
}

output "public_dns" {
  description = "Public DNS"
  value       = aws_instance.admin_host.public_dns
}

#############################################################
# IAM
#############################################################

output "iam_role_name" {
  description = "IAM Role Name"
  value       = aws_iam_role.admin_host.name
}

output "iam_role_arn" {
  description = "IAM Role ARN"
  value       = aws_iam_role.admin_host.arn
}

output "instance_profile_name" {
  description = "IAM Instance Profile"
  value       = aws_iam_instance_profile.admin_host.name
}

#############################################################
# Security Group
#############################################################

output "security_group_id" {
  description = "Admin Host Security Group"
  value       = aws_security_group.admin_host.id
}