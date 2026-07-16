#############################################################
# Amazon Linux 2023 AMI
#############################################################

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["137112412989"]

  filter {

    name = "name"

    values = [

      "al2023-ami-2023*-x86_64"

    ]

  }

  filter {

    name = "architecture"

    values = [

      "x86_64"

    ]

  }

  filter {

    name = "virtualization-type"

    values = [

      "hvm"

    ]

  }

}

#############################################################
# Admin Host
#############################################################

resource "aws_instance" "admin_host" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = var.public_subnet_id

  key_name = var.key_name

  iam_instance_profile = aws_iam_instance_profile.admin_host.name

  vpc_security_group_ids = [

    aws_security_group.admin_host.id

  ]

  associate_public_ip_address = true

user_data = file("${path.module}/user-data.sh.tpl")

  

  root_block_device {

    volume_size = var.root_volume_size

    volume_type = "gp3"

    encrypted = true

    delete_on_termination = true

  }

  metadata_options {

    http_endpoint = "enabled"

    http_tokens = "required"

    http_put_response_hop_limit = 2

  }

  monitoring = true

  tags = merge(

    local.common_tags,

    {

      Name = "${local.name_prefix}-admin-host"

    }

  )

}