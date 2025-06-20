resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags          = var.tags
  vpc_security_group_ids = var.vpc_security_group_ids

  associate_public_ip_address = true

  # key_name = "your-key"  # Optional: if you want to SSH
}
