resource "aws_launch_template" "eks_nodes" {

  name_prefix = "${var.environment}-eks-node-"

  update_default_version = true

  network_interfaces {

    security_groups = [
      aws_eks_cluster.main.vpc_config[0].cluster_security_group_id,
      aws_security_group.eks_node.id
    ]
  }

  block_device_mappings {

    device_name = "/dev/xvda"

    ebs {

      volume_size = var.node_disk_size

      volume_type = "gp3"

      encrypted = true

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