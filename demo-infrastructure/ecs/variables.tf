# ECS CLUSTER VARIABLES

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_cluster_logging" {
  type = string
}

variable "ecs_cluster_cloud_watch_encryption_enabled" {
  type = bool
}

variable "ecs_cluster_tags" {
  type = map(any)
}

# ECS CLUSTER CONFIGURATION VARIABLES

variable "ecs_launch_config_image_id" {
  type = string
}

# If we want to use a created, named ECS cluster we have to put that information into user_data, otherwise our instances will be launched in default cluster.
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

# IAM ROLE VARIABLES

variable "ec2_role_name" {
  type = string
}

# IAM POLICY VARIABLES

variable "iam_policy_name" {
  type = string
}

variable "iam_policy_description" {
  type = string
}

# IAM INSTANCE PROFILE VARIABLES

variable "ec2_profile_name" {
  type = string
}

# SECURITY GROUP VARIABLES

variable "sg_name" {
  type = string
}

variable "sg_tcp_rules" {
  type = map(any)
}

variable "sg_tags" {
  type = map(any)
}
