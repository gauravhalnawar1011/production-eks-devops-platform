#############################################################
# AWS Secrets Manager Secret
#############################################################

resource "aws_secretsmanager_secret" "this" {

  name                    = var.secret_name

  description             = var.description

  kms_key_id              = var.kms_key_arn

  recovery_window_in_days = var.recovery_window_in_days

  tags = merge(

    local.common_tags,

    {

      Name = var.secret_name

    }

  )

}

