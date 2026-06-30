variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "oidc_provider_arn" {
  type = string
}

variable "oidc_provider_url" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

#############################################################
# AWS
#############################################################

variable "aws_region" {

  type = string
}

#############################################################
# EKS
#############################################################

variable "cluster_name" {

  type = string
}

variable "vpc_id" {

  type = string
}

#############################################################
# HELM
#############################################################

variable "chart_version" {

  type = string

  default = "1.13.0"
}