output "instance_id" {

  value = module.admin_host.instance_id

}

output "public_ip" {

  value = module.admin_host.public_ip

}

output "private_ip" {

  value = module.admin_host.private_ip

}

output "public_dns" {

  value = module.admin_host.public_dns

}

output "security_group_id" {

  value = module.admin_host.security_group_id

}


#############################################################
# IAM
#############################################################

output "iam_role_name" {
  description = "IAM Role Name"
  value       = module.admin_host.iam_role_name
}

output "iam_role_arn" {
  description = "IAM Role ARN"
  value       = module.admin_host.iam_role_arn
}