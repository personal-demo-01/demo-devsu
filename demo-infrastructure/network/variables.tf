# VPC VARIABLES

variable "vpc_name" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_dns_support" {
  type = bool
}

variable "vpc_dns_hostnames" {
  type = bool
}

variable "vpc_tags" {
  type = map(any)
}

# VARIABLES FOR SUBNET_PUBLIC
variable "subnet_public_list" {
  type = map(object({
        cidr_block  = string,
        availability_zone = string,
        tags = map(string)
    }))
}
# VARIABLES FOR ROUTE_PUBLIC

variable "route_public_cidr_block" {
  type = string
}

variable "route_public_tags" {
  type = map(any)
}

# VARIABLES FOR INTERNET GATEWAY

variable "igw_tags" {
  type = map(any)
}


