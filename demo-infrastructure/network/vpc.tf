module "vpc" {
  source = "git@github.com:personal-demo-01/demo-terraform-modules.git//vpc?ref=v1.1"
  // source            = "../../demo-terraform-modules/vpc"
  vpc_name          = var.vpc_name
  vpc_cidr_block    = var.vpc_cidr_block
  vpc_dns_support   = var.vpc_dns_support
  vpc_dns_hostnames = var.vpc_dns_hostnames
  vpc_tags          = var.vpc_tags
}