resource "aws_vpc_endpoint" "s3" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.s3"

  vpc_endpoint_type = "Gateway"

  route_table_ids = var.private_route_table_ids

  tags = merge(
    var.common_tags,
    {
      Name = "s3-endpoint"
    }
  )
}


resource "aws_vpc_endpoint" "dynamodb" {

  vpc_id = var.vpc_id

  service_name = "com.amazonaws.${var.aws_region}.dynamodb"

  vpc_endpoint_type = "Gateway"

  route_table_ids = var.private_route_table_ids

  tags = merge(
    var.common_tags,
    {
      Name = "dynamodb-endpoint"
    }
  )
}





