provider "aws" {
  region = var.aws_region
  
}

resource "aws_instance" "TerraformInstance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "AAF"
  vpc_security_group_ids = ["${data.aws_security_group.Web-server.id}"]
  tags = {
    Name = "Terraform Ec2"
  }
  
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    EOF
}
resource "aws_security_group" "Web-server" {
  name = "Web server"
  description = "Allow traffic on port 22 and port 8080"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow for SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Port 8080 used for web servers"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "virtual port that computers use to divert network traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}