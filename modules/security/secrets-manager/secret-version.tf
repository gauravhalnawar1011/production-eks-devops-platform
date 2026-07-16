#############################################################
# Secret Version
#############################################################

resource "aws_secretsmanager_secret_version" "this" {

  count = var.create_secret_version ? 1 : 0

  secret_id = aws_secretsmanager_secret.this.id

  secret_string = jsonencode(var.secret_values)

}