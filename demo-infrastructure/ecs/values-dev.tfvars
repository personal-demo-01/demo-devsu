# ECS CLUSTER VARIABLES
ecs_cluster_name                           = "demo-01-ecs-cluster-dev"
ecs_cluster_logging                        = "OVERRIDE"
ecs_cluster_cloud_watch_encryption_enabled = true
ecs_cluster_tags = {
  Environment   = "dev"
  Resource-Name = "demo-01-ecs-cluster-dev"
}

# ECS CLUSTER CONFIGURATION VARIABLES
ecs_launch_config_image_id      = "ami-014ddabf5947b9cbe"
ecs_launch_config_user_data     = "#!/bin/bash\necho ECS_CLUSTER=demo-01-ecs-cluster-dev >> /etc/ecs/ecs.config"
ecs_launch_config_instance_type = "t2.nano"

# ECS CLUSTER AUTOSCALING GROUP VARIABLES
ecs_asg_name                      = "demo-01-ecs-asg-dev"
ecs_asg_desired_capacity          = 2
ecs_asg_min_size                  = 2
ecs_asg_max_size                  = 4
ecs_asg_health_check_grace_period = 300
ecs_asg_health_check_type         = "EC2"

# SECURITY GROUP VARIABLES
sg_name = "demo-01-sg-01-dev"
sg_tcp_rules = {
  22   = "0.0.0.0/0"
  80 = "0.0.0.0/0"
  8090 = "0.0.0.0/0"
}
sg_tags = {
  Environment   = "dev"
  Resource-Name = "demo-01-sg-01-dev"
}

# IAM ROLE VARIABLES
ec2_role_name = "demo-01-ec2-role-dev"

# IAM POLICY VARIABLES
iam_policy_name        = "demo-01-iam-policy-dev"
iam_policy_description = "CloudWatch loggin policy"

# IAM INSTANCE PROFILE VARIABLES
ec2_profile_name = "demo-01-ec2-profile-dev"
