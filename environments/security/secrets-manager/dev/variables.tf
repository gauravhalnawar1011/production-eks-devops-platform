variable "aws_region" {

  type = string

}

variable "environment" {

  type = string

}

variable "project_name" {

  type = string

}

variable "secret_name" {

  type = string

}

variable "description" {

  type = string

  default = ""

}

variable "secret_values" {

  type = map(string)

}

variable "create_resource_policy" {

  type = bool

  default = false

}

variable "allowed_principal_arns" {

  type = list(string)

  default = []

}

variable "enable_rotation" {

  type = bool

  default = false

}

variable "rotation_lambda_arn" {

  type = string

  default = null

}

variable "rotation_days" {

  type = number

  default = 30

}