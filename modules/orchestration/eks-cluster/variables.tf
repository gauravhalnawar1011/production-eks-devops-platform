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
  type    = string
  default = "1.35"
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "eks_cluster_sg_id" {
  type = string
}

variable "eks_node_sg_id" {
  type = string
}

variable "kms_key_arn" {
  type = string
}

variable "instance_types" {

  type = list(string)

  default = ["t3.micro"]
}

variable "desired_size" {

  type = number

  default = 2
}

variable "min_size" {

  type = number

  default = 2
}

variable "max_size" {

  type = number

  default = 4
}

variable "managed_by" {

  type = string

  default = "Terraform"
}

variable "cloudwatch_log_retention_days" {

  type = number

  default = 30
}

variable "node_disk_size" {

  type = number

  default = 50
}

variable "ami_type" {

  type = string

  default = "BOTTLEROCKET_x86_64"
}