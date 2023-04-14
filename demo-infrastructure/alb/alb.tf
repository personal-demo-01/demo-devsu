module "ecr" {
  source = "git@github.com:personal-demo-01/demo-terraform-modules.git//alb?ref=v1.1"
  // source = "../../demo-terraform-modules/alb"
  # APPLICATION LOAD BALANCER (ALB)
  alb_name            = var.alb_name
  alb_security_groups = [module.security_groups.sg_name_id]
  alb_subnets         = [data.aws_subnet.subnet_public_01.id, data.aws_subnet.subnet_public_02.id]
  alb_tags            = var.alb_tags
  alb_listener_port=var.alb_listener_port

  # ALB TARGET GROUP
  alb_tg_name   = var.alb_tg_name
  alb_tg_port   = var.alb_tg_port
  alb_tg_vpc_id = data.aws_vpc.vpc.id
  alb_tg_tags   = var.alb_tg_tags
}
data "aws_subnet" "subnet_public_01" {
  filter {
    name   = "tag:Resource-Name"
    values = ["demo-01-subnet-public-01-dev"]
  }
}

data "aws_subnet" "subnet_public_02" {
  filter {
    name   = "tag:Resource-Name"
    values = ["demo-01-subnet-public-02-dev"]
  }
}
