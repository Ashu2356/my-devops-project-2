variable "key_name" {
  default = "my-key"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ami" {
  default = "ami-007020fd9c84e18c7" # Ubuntu 22.04 in ap-south-1
}

