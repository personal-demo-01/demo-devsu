module "security_groups" {
  source = "git@github.com:personal-demo-01/demo-terraform-modules.git//sg?ref=v1.1"
  // source = "../../demo-terraform-modules/sg"

  sg_name      = var.sg_name
  sg_tcp_rules = var.sg_tcp_rules
  sg_vpc       = data.aws_vpc.vpc.id
  sg_tags      = var.sg_tags
}


data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Resource-Name"
    values = ["demo-01-vpc-dev"]
  }
}
