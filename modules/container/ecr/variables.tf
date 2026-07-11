variable "environment" {

  type = string
}

variable "project_name" {

  type = string
}

variable "repository_name" {

  type = string
}

variable "image_tag_mutability" {

  type = string

  default = "IMMUTABLE"
}

variable "force_delete" {

  type = bool

  default = false
}

variable "kms_key_arn" {

  type = string
}

variable "common_tags" {

  type = map(string)
}