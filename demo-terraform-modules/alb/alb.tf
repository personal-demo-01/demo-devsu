resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = var.alb_load_balancer_type
  security_groups    = var.alb_security_groups
  subnets            = var.alb_subnets

  enable_deletion_protection = var.alb_enable_deletion_protection

  tags = var.alb_tags
}

resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = aws_lb.alb.arn 
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol
  
  default_action {    
    target_group_arn = aws_lb_target_group.alb_tg.arn
    type             = "forward"  
  }
}

# resource "aws_lb" "test" {
#   name               = "test-lb-tf"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.lb_sg.id]
#   subnets            = [for subnet in aws_subnet.public : subnet.id]

#   enable_deletion_protection = true

#   tags = {
#     Environment = "production"
#   }
# }
