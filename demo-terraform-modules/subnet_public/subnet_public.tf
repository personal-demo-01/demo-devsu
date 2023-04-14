resource "aws_subnet" "subnet_public" {
  for_each                = var.subnet_public_list
  vpc_id                  = var.subnet_public_vpc_id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = var.subnet_public_public_ip
  availability_zone       = each.value.availability_zone
  tags                    = each.value.tags
}

resource "aws_route_table_association" "ra_public" {
  for_each       = var.subnet_public_list
  subnet_id      = aws_subnet.subnet_public[each.key].id
  route_table_id = aws_route_table.route_public.id
}
