
module "ec2" {
  source = "./modules/ec2"

user_data = var.user_data

  instance_profile = module.role.instance_role_name
}
module "s3" {
  source = "./modules/s3"
  bucket_name = "s3-bucket-auf134gabe"
  bucket_encryption_enabled = true
}

module "role" {
  source           = "./modules/iam"
  role_name        = "MyEC2InstanceRole"
  policy_actions   = ["s3:*"]
  policy_effect    = "Allow"
  policy_resources = [module.s3.bucket_arn, "${module.s3.bucket_arn}/*"]
}
