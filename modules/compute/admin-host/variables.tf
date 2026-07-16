variable "aws_region" {

  type = string

}

variable "public_subnet_id" {

  type = string

}

variable "instance_type" {

  type = string

  default = "t3.small"

}

variable "key_name" {

  type = string

  default = null

}

variable "root_volume_size" {

  type = number

  default = 30

}

variable "tags" {

  type = map(string)

  default = {}

}


variable "vpc_id" {
  type = string
}

variable "allowed_ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}


variable "project_name" {
  
}
variable "environment" {
  
}

