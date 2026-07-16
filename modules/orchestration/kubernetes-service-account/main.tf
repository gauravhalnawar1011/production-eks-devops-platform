resource "kubernetes_service_account_v1" "this" {

  metadata {

    name = var.service_account_name

    namespace = var.namespace

    labels = var.labels

    annotations = merge(

      var.annotations,

      {

        "eks.amazonaws.com/role-arn" = var.role_arn

      }

    )

  }

  automount_service_account_token = true

}