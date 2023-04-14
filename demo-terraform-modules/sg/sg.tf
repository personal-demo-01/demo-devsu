resource "aws_security_group" "web_sg" {
  name   = var.sg_name
  vpc_id = var.sg_vpc
  tags                 = var.sg_tags

  dynamic "ingress" {
    for_each = var.sg_tcp_rules
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
