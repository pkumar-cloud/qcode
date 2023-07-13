variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile"
  default     = "default"
}

variable "ami" {
  default = "ami-0ae49954dfb447966"
}

variable "associate_ip" {
  default = true

}
variable "instance_type" {
  default = "t2.micro"
}

variable "key-name" {
  default = "pkdev-use1"
}

variable "vpc_cidr" {
  default = "10.3.0.0/18"
}

variable "subnet_cidr" {
  default = "10.3.1.0/24"
}
