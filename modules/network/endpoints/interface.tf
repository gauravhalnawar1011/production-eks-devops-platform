resource "aws_vpc_endpoint" "ecr_api" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.ecr.api"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "ecr-api-endpoint"
    }
  )
}

resource "aws_vpc_endpoint" "ecr_dkr" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.ecr.dkr"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "ecr-dkr-endpoint"
    }
  )
}

resource "aws_vpc_endpoint" "sts" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.sts"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "sts-endpoint"
    }
  )
}

resource "aws_vpc_endpoint" "kms" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.kms"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "kms-endpoint"
    }
  )
}

resource "aws_vpc_endpoint" "secretsmanager" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.secretsmanager"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "secretsmanager-endpoint"
    }
  )
}


resource "aws_vpc_endpoint" "logs" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.logs"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "logs-endpoint"
    }
  )
}



resource "aws_vpc_endpoint" "monitoring" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.monitoring"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "monitoring-endpoint"
    }
  )
}



resource "aws_vpc_endpoint" "ssm" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.ssm"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "ssm-endpoint"
    }
  )
}


resource "aws_vpc_endpoint" "ssmmessages" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.ssmmessages"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "ssmmessages-endpoint"
    }
  )
}


resource "aws_vpc_endpoint" "ec2messages" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.ec2messages"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "ec2messages-endpoint"
    }
  )
}


resource "aws_vpc_endpoint" "ec2" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.ec2"

  vpc_endpoint_type = "Interface"

  subnet_ids = var.private_subnet_ids

  security_group_ids = [
    var.endpoint_security_group_id
  ]

  private_dns_enabled = true

  tags = merge(
    var.common_tags,
    {
      Name = "ec2-endpoint"
    }
  )
}