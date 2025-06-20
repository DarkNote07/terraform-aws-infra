variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "vpc_security_group_ids" {
  type = list(string)
}
