locals {

  role_name = "${var.project_name}-${var.environment}-${var.name}"

  common_tags = merge(

    var.common_tags,

    {

      Module = "IRSA"

      Terraform = "true"

    }

  )

}