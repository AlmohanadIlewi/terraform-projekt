resource "aws_iam_role" "role" {
  name = var.role_name
  path = "/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_iam_role_policy" "role_policy" {
  name = "${var.role_name}-policy"
  role = aws_iam_role.role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = var.policy_actions
        Effect   = var.policy_effect
        Resource = var.policy_resources
      },
    ]
  })
}

resource "aws_iam_instance_profile" "myprofile" {
  name = "${var.role_name}-myprofile"
  role = aws_iam_role.role.name
}

resource "aws_iam_role_policy_attachment" "ec2_s3_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.role.name
}