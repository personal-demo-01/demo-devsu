# ECS CLUSTER VARIABLES

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_cluster_logging" {
  description = "Redirecting logs"
  type        = string
}

variable "ecs_cluster_cloud_watch_encryption_enabled" {
  description = "Encryption"  
  type = bool
}

variable "ecs_cluster_tags" {
  type = map(any)
}

# ECS CLUSTER CONFIGURATION VARIABLES

variable "ecs_launch_config_image_id" {
  type = string
}

variable "ecs_launch_config_iam_instance_profile" {
  type = string
}

variable "ecs_launch_config_security_groups" {
  type    = list(any)
}

variable "ecs_launch_config_user_data" {
  type = string
}

variable "ecs_launch_config_instance_type" {
  type = string
}

# ECS CLUSTER AUTOSCALING GROUP VARIABLES

variable "ecs_asg_name" {
  type = string
}

variable "ecs_asg_vpc_zone_identifier" {
  type = list(any)
}

variable "ecs_asg_desired_capacity" {
  type = number
}

variable "ecs_asg_min_size" {
  type = number
}

variable "ecs_asg_max_size" {
  type = number
}

variable "ecs_asg_health_check_grace_period" {
  type = number
}

variable "ecs_asg_health_check_type" {
  type = string
}