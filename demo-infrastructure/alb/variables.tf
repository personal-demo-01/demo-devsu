# APPLICATION LOAD BALANCER (ALB)
variable "alb_name" {
  type = string
}
variable "alb_tags" {
  type = map(any)
}
variable "alb_listener_port" {
  type =string
}

# ALB TARGET GROUP
variable "alb_tg_name" {
  type = string
}
variable "alb_tg_port" {
  type = number
}
variable "alb_tg_tags" {
  type = map(any)
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
