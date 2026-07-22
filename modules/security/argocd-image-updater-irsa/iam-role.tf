resource "aws_iam_role" "this" {

  name = local.role_name

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = var.tags

}

resource "aws_iam_role_policy_attachment" "this" {

  role       = aws_iam_role.this.name

  policy_arn = aws_iam_policy.this.arn

}