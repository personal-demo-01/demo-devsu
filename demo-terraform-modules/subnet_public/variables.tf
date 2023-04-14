
# VARIABLES FOR SUBNET_PUBLIC

variable "subnet_public_list" {
  description = "Parameters for each subnet"
  type = map(object({
        cidr_block  = string,
        availability_zone = string,
        tags = map(string)
    }))
}
variable "subnet_public_public_ip" {
  description = "assign public ip to the instaces in the subnet"
  type = bool
  default=true
}
variable "subnet_public_vpc_id" {
  type = string
}

# VARIABLES FOR ROUTE_PUBLIC

variable "route_public_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
}

variable "route_public_tags" {
  type        = map(any)
}

# VARIABLES FOR INTERNET GATEWAY

variable "igw_tags" {
  type        = map(any)
}
