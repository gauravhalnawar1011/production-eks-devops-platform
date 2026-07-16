#############################################################
# Admin Host Security Group
#############################################################

resource "aws_security_group" "admin_host" {

  name        = "${local.name_prefix}-admin-host-sg"

  description = "Security Group for Admin Host"

  vpc_id = var.vpc_id

  tags = merge(

    local.common_tags,

    {

      Name = "${local.name_prefix}-admin-host-sg"

    }

  )

}

#############################################################
# SSH
#############################################################

resource "aws_vpc_security_group_ingress_rule" "ssh" {

  security_group_id = aws_security_group.admin_host.id

  cidr_ipv4 = var.allowed_ssh_cidr

  from_port = 22

  to_port = 22

  ip_protocol = "tcp"

  description = "Allow SSH"

}

#############################################################
# HTTPS
#############################################################

resource "aws_vpc_security_group_egress_rule" "https" {

  security_group_id = aws_security_group.admin_host.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 443

  to_port = 443

  ip_protocol = "tcp"

  description = "HTTPS"

}

#############################################################
# HTTP
#############################################################

resource "aws_vpc_security_group_egress_rule" "http" {

  security_group_id = aws_security_group.admin_host.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 80

  to_port = 80

  ip_protocol = "tcp"

  description = "HTTP"

}

#############################################################
# DNS TCP
#############################################################

resource "aws_vpc_security_group_egress_rule" "dns_tcp" {

  security_group_id = aws_security_group.admin_host.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 53

  to_port = 53

  ip_protocol = "tcp"

  description = "DNS TCP"

}

#############################################################
# DNS UDP
#############################################################

resource "aws_vpc_security_group_egress_rule" "dns_udp" {

  security_group_id = aws_security_group.admin_host.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 53

  to_port = 53

  ip_protocol = "udp"

  description = "DNS UDP"

}

#############################################################
# All Internal VPC Traffic
#############################################################

resource "aws_vpc_security_group_egress_rule" "vpc" {

  security_group_id = aws_security_group.admin_host.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"

  description = "VPC Communication"

}