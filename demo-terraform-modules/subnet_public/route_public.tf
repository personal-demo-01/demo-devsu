resource "aws_route_table" "route_public" {
  vpc_id = var.subnet_public_vpc_id

  route {
    cidr_block = var.route_public_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = var.route_public_tags
}
