output "argocd_image_updater_role_arn" {
  value = module.argocd_image_updater_irsa.role_arn
}

output "argocd_image_updater_role_name" {
  value = module.argocd_image_updater_irsa.role_name
}

output "argocd_image_updater_policy_arn" {
  value = module.argocd_image_updater_irsa.policy_arn
}