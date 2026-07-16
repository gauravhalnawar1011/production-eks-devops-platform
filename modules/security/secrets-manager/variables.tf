variable "environment" {}

variable "project_name" {}

variable "secret_name" {}

variable "description" {
  default = ""
}

variable "kms_key_arn" {}

variable "secret_values" {
  type = map(string)
}

variable "recovery_window_in_days" {
  default = 7
}

variable "create_resource_policy" {
  default = false
}

variable "allowed_principal_arns" {
  type    = list(string)
  default = []
}

variable "common_tags" {
  type = map(string)
}

variable "enable_rotation" {

  description = "Enable automatic secret rotation"

  type = bool

  default = false

}

variable "rotation_lambda_arn" {

  description = "Lambda ARN used for secret rotation"

  type = string

  default = null

}

variable "rotation_days" {

  description = "Number of days between secret rotations"

  type = number

  default = 30

}

variable "create_secret_version" {
  type    = bool
  default = true
}