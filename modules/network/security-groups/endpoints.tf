#################################################
# VPC ENDPOINT SECURITY GROUP
#################################################

resource "aws_security_group" "vpce" {

  name = "${var.environment}-vpce-sg"

  description = "Security Group for Interface VPC Endpoints"

  vpc_id = var.vpc_id

  tags = merge(

    var.common_tags,

    {
      Name = "${var.environment}-vpce-sg"
    }
  )
}

#################################################
# INBOUND HTTPS FROM VPC
#################################################

resource "aws_security_group_rule" "vpce_https_ingress" {

  type = "ingress"

  from_port = 443

  to_port = 443

  protocol = "tcp"

  cidr_blocks = [
    var.vpc_cidr
  ]

  security_group_id = aws_security_group.vpce.id

  description = "Allow HTTPS traffic from VPC"
}

#################################################
# OUTBOUND
#################################################

resource "aws_security_group_rule" "vpce_egress" {

  type = "egress"

  from_port = 0

  to_port = 0

  protocol = "-1"

  cidr_blocks = [
    "0.0.0.0/0"
  ]

  security_group_id = aws_security_group.vpce.id

  description = "Allow all outbound traffic"
}