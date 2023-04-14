module "ecr" {
  source = "git@github.com:personal-demo-01/demo-terraform-modules.git//ecs_cluster?ref=v1.1"
  // source = "../../demo-terraform-modules/ecs_cluster"
  
  ecs_cluster_name                           = var.ecs_cluster_name
  ecs_cluster_logging                        = var.ecs_cluster_logging
  ecs_cluster_cloud_watch_encryption_enabled = var.ecs_cluster_cloud_watch_encryption_enabled
  ecs_cluster_tags                           = var.ecs_cluster_tags

  ecs_launch_config_image_id             = var.ecs_launch_config_image_id
  ecs_launch_config_iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  ecs_launch_config_security_groups      = [module.security_groups.sg_name_id]
  ecs_launch_config_user_data            = var.ecs_launch_config_user_data
  ecs_launch_config_instance_type        = var.ecs_launch_config_instance_type

  ecs_asg_name                      = var.ecs_asg_name
  ecs_asg_vpc_zone_identifier       = [data.aws_subnet.subnet_public_01.id, data.aws_subnet.subnet_public_02.id]
  ecs_asg_desired_capacity          = var.ecs_asg_desired_capacity
  ecs_asg_min_size                  = var.ecs_asg_min_size
  ecs_asg_max_size                  = var.ecs_asg_max_size
  ecs_asg_health_check_grace_period = var.ecs_asg_health_check_grace_period
  ecs_asg_health_check_type         = var.ecs_asg_health_check_type
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
