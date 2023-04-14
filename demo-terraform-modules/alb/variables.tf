# APPLICATION LOAD BALANCER (ALB)
variable "alb_name" {
  type = string
}
variable "alb_internal" {
  type    = bool
  default = false
}
variable "alb_load_balancer_type" {
  type    = string
  default = "application"
}
variable "alb_security_groups" {
  type = list(any)
}
variable "alb_subnets" {
  type = list(any)
}
variable "alb_enable_deletion_protection" {
  type    = bool
  default = false
}
variable "alb_tags" {
  type = map(any)
}

# ALB LISTENER
variable "alb_listener_port" {
  type =string
}
variable "alb_listener_protocol" {
  type = string
  default = "HTTP"
}

# ALB TARGET GROUP
variable "alb_tg_name" {
  type = string
}
variable "alb_tg_port" {
  type = number
}
variable "alb_tg_protocol" {
  type    = string
  default = "HTTP"
}
variable "alb_tg_vpc_id" {
  type = string
}
variable "alb_tg_tags" {
  type = map(any)
}
variable "alb_tg_health_check_path" {
  type    = string
  default = "/"
}
variable "alb_tg_health_check_port" {
  type    = number
  default = 80
}
