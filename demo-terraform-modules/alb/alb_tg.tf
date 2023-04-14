resource "aws_lb_target_group" "alb_tg" {
  name        = var.alb_tg_name
  port        = var.alb_tg_port
  protocol    = var.alb_tg_protocol
  vpc_id      = var.alb_tg_vpc_id
  tags        = var.alb_tg_tags
  health_check {
    path                = var.alb_tg_health_check_path
    port                = var.alb_tg_health_check_port
  }
}
