data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "launch-wizard-16" {
  name = "launch-wizard-16"
}

variable "instance_type" {
  default ="t2.micro"
}

variable "components" {
  default = ["frontend", "mongodb", "catalogue"]
}

resource "aws_instance" "instance" {
  count        = length(var.components)
  ami = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.launch-wizard-16.id]
  tags = {
    Name = var. components[count.index]
  }
}
//resource "aws_route53_record" "frontend" {
 // zone_id = "Z07633651VJKTEQ867N3J"
 // name = "frontend-dev.rdevopsb72.online"
 // type = "A"
 // ttl = 30
//records = [aws_instance.frontend.private_ip]
//}
