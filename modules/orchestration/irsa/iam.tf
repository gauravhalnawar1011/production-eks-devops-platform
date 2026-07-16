#############################################################
# OIDC Trust Policy
#############################################################

data "aws_iam_policy_document" "assume_role" {

  statement {

    effect = "Allow"

    actions = [

      "sts:AssumeRoleWithWebIdentity"

    ]

    principals {

      type = "Federated"

      identifiers = [

        var.oidc_provider_arn

      ]

    }

    condition {

      test = "StringEquals"

      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"

      values = [

        "system:serviceaccount:${var.namespace}:${var.service_account_name}"

      ]

    }

  }

}

#############################################################
# IAM Role
#############################################################

resource "aws_iam_role" "this" {

  name = local.role_name

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = local.common_tags

}