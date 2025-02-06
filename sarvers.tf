data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}

variable "instance_type" {
  default ="t2.micro"
}

resource "aws_instance" "frontend" {
  ami = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  tags = {
    Name = "frontend"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = "Z07633651VJKTEQ867N3J"
  name = "frontend-dev.rdevopsb72.online"
  type = "A"
  ttl = 30
records = [aws_instance.frontend.private_ip]
}
