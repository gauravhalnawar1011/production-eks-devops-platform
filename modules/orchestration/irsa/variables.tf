variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "name" {
  description = "Application name (backend, external-dns, alb-controller)"
  type        = string
}

variable "oidc_provider_arn" {
  type = string
}

variable "oidc_provider_url" {
  type = string
}

variable "namespace" {
  type = string
}

variable "service_account_name" {
  type = string
}

variable "policy_arns" {

  description = "IAM Policies to attach"

  type = list(string)

  default = []

}

variable "common_tags" {

  type = map(string)

}