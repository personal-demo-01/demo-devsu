module "subnet_public" {
  source = "git@github.com:personal-demo-01/demo-terraform-modules.git//subnet_public?ref=v1.1"
  // source = "../../demo-terraform-modules/subnet_public"

  subnet_public_vpc_id = module.vpc.vpc_id
  subnet_public_list   = var.subnet_public_list
  // subnet_public_cidr_block        = var.subnet_public_cidr_block
  // subnet_public_public_ip         = var.subnet_public_public_ip
  // subnet_public_availability_zone = var.subnet_public_availability_zone
  // subnet_public_tags              = var.subnet_public_tags
  route_public_cidr_block = var.route_public_cidr_block
  route_public_tags       = var.route_public_tags
  igw_tags                = var.igw_tags

}
