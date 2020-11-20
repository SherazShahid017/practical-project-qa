resource "aws_instance" "instance1" {
  ami                    = "ami-0dc8d444ee2a42d8a"
  instance_type          = "t2.micro"
  key_name               = "instance1-key"
  vpc_security_group_ids = [var.secID]
  subnet_id              = var.ec2sub

  tags = {
    Name = "Terraform-built-ec2"
  }

  user_data = data.template_file.scripts.template

}

data "template_file" "scripts" {
  template = file("${path.module}/EC2/script/script.sh")
}
