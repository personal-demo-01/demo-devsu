variable "sg_name" {
  type    = string
}

variable "sg_vpc" {
  description = "VPC id"
  type    = string
}

variable "sg_tcp_rules" {
  description = "Security groups rules"
  type        = map(any)
}

variable "sg_tags" {
  type        = map(any)
}

