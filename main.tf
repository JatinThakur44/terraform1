module "vpc" {
  source            = "./modules/vpc"
  cidr_block        = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
}

module "security_group" {
  source = "./modules/security_group"
  name   = "instance_security_group"
  vpc_id = module.vpc.vpc_id
}

data "aws_ami" "myimage" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}
module "ec2" {
  source            = "./modules/ec2"
  ami               = data.aws_ami.myimage.image_id
  instance_type     = var.instance_type
  security_group_id = module.security_group.sg_id
  subnet_id         = module.vpc.subnet_id
  instance_name     = "WebInstance"
}
