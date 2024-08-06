resource "aws_iam_user" "lb" {
  name = var.username

  tags = {
    tag-key = var.tag
  }
}

