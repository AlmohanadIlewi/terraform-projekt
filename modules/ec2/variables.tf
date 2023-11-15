variable "ami_id" {
  type = string
  default = "ami-06dd92ecc74fdfb36"

}

variable "instance_type" {
  type = string
  default = "t2.micro"
    
}

variable "instance_profile" {
  type = string
  default = ""
}

variable "key_name" {
  type    = string
  default = ""
}

# EC2-Modul zu erweitern und den Parameter user_data als String zu übergeben
variable "user_data" {
  type        = string
  default     = null
}

# "//wsl.localhost/Debian/home/mohanad/.ssh/promkey.pem"