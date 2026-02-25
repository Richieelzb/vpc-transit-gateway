resource "aws_instance" "ec2-public-vpc1" {
  ami = data.aws_ami.my-data-ami.id
  //ami = "ami-0bc691261a82b32bc"
  instance_type          = var.instance-type-list[0]
  key_name               = var.key-pair
  user_data              = file("${path.module}/app-install.sh")
  subnet_id              = module.VPC-A.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.public-sg1-ec2.id]
  #count                  = 3
  tags = {
    Name = "ec2-jump-host"
  }
}