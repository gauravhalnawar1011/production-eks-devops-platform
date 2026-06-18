resource "aws_security_group" "bastion_sg" {

name = "${var.environment}-bastion-sg"

description = "Bastion Host Security Group"

vpc_id = var.vpc_id

ingress {


description = "SSH"

from_port = 22

to_port = 22

protocol = "tcp"

cidr_blocks = [var.admin_access_cidr]


}

egress {


from_port = 0

to_port = 0

protocol = "-1"

cidr_blocks = ["0.0.0.0/0"]


}

tags = merge(
var.common_tags,
{
Name = "${var.environment}-bastion-sg"
}
)
}

resource "aws_security_group" "alb_sg" {

name = "${var.environment}-alb-sg"

description = "Application Load Balancer SG"

vpc_id = var.vpc_id

ingress {


from_port = 80

to_port = 80

protocol = "tcp"

cidr_blocks = ["0.0.0.0/0"]


}

ingress {


from_port = 443

to_port = 443

protocol = "tcp"

cidr_blocks = ["0.0.0.0/0"]


}

egress {


from_port = 0

to_port = 0

protocol = "-1"

cidr_blocks = ["0.0.0.0/0"]


}

tags = merge(
var.common_tags,
{
Name = "${var.environment}-alb-sg"
}
)
}

resource "aws_security_group" "eks_cluster_sg" {

name = "${var.environment}-eks-cluster-sg"

description = "EKS Control Plane Security Group"

vpc_id = var.vpc_id

egress {


from_port = 0

to_port = 0

protocol = "-1"

cidr_blocks = ["0.0.0.0/0"]


}

tags = merge(
var.common_tags,
{
Name = "${var.environment}-eks-cluster-sg"
}
)
}

resource "aws_security_group" "eks_node_sg" {

name = "${var.environment}-eks-node-sg"

description = "EKS Worker Node Security Group"

vpc_id = var.vpc_id

ingress {


from_port = 0

to_port = 65535

protocol = "tcp"

self = true


}

egress {


from_port = 0

to_port = 0

protocol = "-1"

cidr_blocks = ["0.0.0.0/0"]


}

tags = merge(
var.common_tags,
{
Name = "${var.environment}-eks-node-sg"
}
)
}

resource "aws_security_group_rule" "alb_to_node" {

type = "ingress"

from_port = 30000

to_port = 32767

protocol = "tcp"

security_group_id = aws_security_group.eks_node_sg.id

source_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "cluster_to_node" {

type = "ingress"

from_port = 443

to_port = 443

protocol = "tcp"

security_group_id = aws_security_group.eks_node_sg.id

source_security_group_id = aws_security_group.eks_cluster_sg.id
}
