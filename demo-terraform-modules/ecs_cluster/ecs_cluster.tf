# resource "aws_kms_key" "kms" {
#   description             = var.kms_description
#   deletion_window_in_days = var.kms_deletion_window_in_days
#   tags                    = var.kms_tags
# }

# resource "aws_cloudwatch_log_group" "cw_log_group" {
#   name = var.cw_name
#   tags = var.cw_log_group_tags
# }

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
  tags = var.ecs_cluster_tags
}

resource "aws_launch_configuration" "ecs_launch_config" {
  image_id             = var.ecs_launch_config_image_id
  iam_instance_profile = var.ecs_launch_config_iam_instance_profile
  security_groups      = var.ecs_launch_config_security_groups
  user_data            = var.ecs_launch_config_user_data
  instance_type        = var.ecs_launch_config_instance_type
}

resource "aws_autoscaling_group" "ecs_asg" {
  name                 = var.ecs_asg_name
  vpc_zone_identifier  = var.ecs_asg_vpc_zone_identifier
  launch_configuration = aws_launch_configuration.ecs_launch_config.name

  desired_capacity          = var.ecs_asg_desired_capacity
  min_size                  = var.ecs_asg_min_size
  max_size                  = var.ecs_asg_max_size
  health_check_grace_period = var.ecs_asg_health_check_grace_period
  health_check_type         = var.ecs_asg_health_check_type
}
