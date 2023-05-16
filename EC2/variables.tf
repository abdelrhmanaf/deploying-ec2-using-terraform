variable "aws_region" {
  description = "regions my resources will be deployed"
  type        = string
  default     = "us-east-1"
}
variable "ami"{
    description = "ami for ubuntu"
    type = string
    default = "ami"
}
variable "instance_type"{
    description = "type of the Instance"
    type = string
    default = "t2.micro"
}