#############################################################
# EKS Access Entry
#############################################################

resource "aws_eks_access_entry" "this" {

  for_each = var.access_entries

  cluster_name = var.cluster_name

  principal_arn = each.value.principal_arn

  kubernetes_groups = each.value.kubernetes_groups

  type = "STANDARD"

}

#############################################################
# EKS Access Policy Association
#############################################################

locals {

  policy_associations = flatten([

    for access_name, access in var.access_entries : [

      for association in access.policy_associations : {

        id = "${access_name}-${replace(basename(association.policy_arn), ":", "-")}"

        principal_arn = access.principal_arn

        policy_arn = association.policy_arn

        access_scope = association.access_scope

      }

    ]

  ])

}

resource "aws_eks_access_policy_association" "this" {

  for_each = {

    for association in local.policy_associations :

    association.id => association

  }

  cluster_name = var.cluster_name

  principal_arn = each.value.principal_arn

  policy_arn = each.value.policy_arn

  access_scope {

    type = each.value.access_scope.type

    namespaces = try(each.value.access_scope.namespaces, null)

  }

}