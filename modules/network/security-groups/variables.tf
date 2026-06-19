variable "vpc_id" {

  type = string
}

variable "environment" {

  type = string
}

variable "admin_access_cidr" {

  type = string
}

variable "common_tags" {

  type = map(string)
}
variable "vpc_cidr" {

  type = string
}

