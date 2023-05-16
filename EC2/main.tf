
resource "aws_instance" "TerraformInstance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "AAF"
  tags = {
    Name = "Terraform Ec2"
  }
  
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    EOF
}
