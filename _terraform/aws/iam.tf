resource "aws_iam_user" "davy" {
  name = "Davy"
}

resource "aws_iam_group" "administrators" {
  name = "Administrators"
}

resource "aws_iam_group_membership" "administrators_membership" {
    name = "administrators_membership"
    users = [
        aws_iam_user.davy.name
    ]
    group = aws_iam_group.administrators.name
}

resource "aws_iam_group_policy_attachment" "administrators" {
  group       = aws_iam_group.administrators.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
