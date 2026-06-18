#################################################
# AWS
#################################################

variable "aws_region" {

  type = string

  default = "ap-south-1"
}

#################################################
# ENVIRONMENT
#################################################

variable "environment" {

  type = string
}

#################################################
# PROJECT
#################################################

variable "project_name" {

  type = string
}

#################################################
# ECR
#################################################

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


#################################################
# TAGS
#################################################

variable "managed_by" {

  type = string

  default = "Terraform"
}