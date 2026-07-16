#############################################################
# IAM Instance Profile
#############################################################

resource "aws_iam_instance_profile" "admin_host" {

  name = "${local.name_prefix}-admin-host-profile"

  role = aws_iam_role.admin_host.name

  tags = local.common_tags

}