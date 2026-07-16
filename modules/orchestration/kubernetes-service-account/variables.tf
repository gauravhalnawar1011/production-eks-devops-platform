variable "namespace" {

  description = "Kubernetes Namespace"

  type = string

}

variable "service_account_name" {

  description = "Service Account Name"

  type = string

}

variable "role_arn" {

  description = "IAM Role ARN (IRSA)"

  type = string

}

variable "labels" {

  description = "Labels"

  type = map(string)

  default = {}

}

variable "annotations" {

  description = "Additional annotations"

  type = map(string)

  default = {}

}