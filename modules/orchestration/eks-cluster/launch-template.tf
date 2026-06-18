resource "aws_launch_template" "eks_nodes" {

  name_prefix = "${var.environment}-eks-node-"

  update_default_version = true

  block_device_mappings {

    device_name = "/dev/xvda"

    ebs {

      volume_size = var.node_disk_size

      volume_type = "gp3"

      encrypted = true

      kms_key_id = var.kms_key_arn

      delete_on_termination = true
    }
  }

  monitoring {

    enabled = true
  }

  tag_specifications {

    resource_type = "instance"

    tags = merge(

      local.common_tags,

      {
        Name = "${var.environment}-eks-node"
      }
    )
  }
}