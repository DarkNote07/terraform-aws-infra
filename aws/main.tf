module "vpc" {
  source              = "../modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  region              = var.region
}

module "ec2_instance" {
  source         = "../modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.vpc.public_subnet_id
  vpc_security_group_ids = [module.ec2_sg.security_group_id]

  tags = {
    Name        = "dev-web-server"
    Environment = "dev"
  }
}


module "ec2_sg" {
  source   = "../modules/security_group"
  vpc_id   = module.vpc.vpc_id
  tags     = {
    Name = "ec2-sg"
  }

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Replace with your real IP
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

