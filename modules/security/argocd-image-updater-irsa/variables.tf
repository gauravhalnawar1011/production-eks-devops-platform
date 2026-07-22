variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "oidc_provider_arn" {
  description = "EKS OIDC Provider ARN"
  type        = string
}

variable "oidc_provider_url" {
  description = "EKS OIDC Provider URL"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
  default     = "argocd"
}

variable "service_account_name" {
  description = "ServiceAccount name"
  type        = string
  default     = "argocd-image-updater"
}

variable "tags" {
  type = map(string)
}