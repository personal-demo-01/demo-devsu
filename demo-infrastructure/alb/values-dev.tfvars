# APPLICATION LOAD BALANCER (ALB)
alb_name = "demo-alb-dev"
alb_tags = {
  Environment   = "dev"
  Resource-Name = "demo-alb-dev"
}
alb_listener_port="80"
# ALB TARGET GROUP
alb_tg_name = "demo-alb-tg-dev"
alb_tg_port = 80
alb_tg_tags = {
  Environment   = "dev"
  Resource-Name = "demo-alb-tg-dev"
}

# SECURITY GROUP VARIABLES
sg_name = "demo-alb-sg-dev"
sg_tcp_rules = {
  80   = "0.0.0.0/0",
  8090 = "0.0.0.0/0"
}
sg_tags = {
  Environment   = "dev"
  Resource-Name = "demo-alb-sg-dev"
}
