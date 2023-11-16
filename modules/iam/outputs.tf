output "instance_role_name" {
  value = aws_iam_instance_profile.my-profile.name
}
output "role_arn" {
  value = aws_iam_role.role.arn
}