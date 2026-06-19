variable "aws_region" {

  type = string

  default = "ap-south-1"
}

variable "environment" {

  type = string
}

variable "project_name" {

  type = string
}

variable "cluster_name" {

  type = string
}

variable "cluster_version" {

  type = string
}

variable "instance_types" {

  type = list(string)
}

variable "desired_size" {

  type = number
}

variable "min_size" {

  type = number
}

variable "max_size" {

  type = number
}

variable "node_disk_size" {

  type = number
}

variable "cloudwatch_log_retention_days" {

  type = number
}

variable "ami_type" {

  type = string
}

variable "managed_by" {

  type = string

  default = "Terraform"
}

variable "addons" {

  type = list(object({

    name    = string

    version = string
  }))
}

