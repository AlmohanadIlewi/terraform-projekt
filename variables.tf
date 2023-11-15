variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "user_data" {
  type    = string
  default = ""

#   default = <<-EOF
#               #!/bin/bash
#               mkdir /tmp
#               echo "مرحبًا من البرنامج النصي لبيانات المستخدم" > /tmp/hello.txt
#               /usr/bin/aws s3 cp /tmp/hello.txt s3://s3-bucket-auf134gabe/
#             EOF
 }