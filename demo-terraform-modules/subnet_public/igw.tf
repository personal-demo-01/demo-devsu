resource "aws_internet_gateway" "igw" {
  vpc_id = var.subnet_public_vpc_id
 
  tags = var.igw_tags
}