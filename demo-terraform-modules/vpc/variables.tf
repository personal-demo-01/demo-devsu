# GENERAL VARIABLES

variable "vpc_name" {
  description = "VPC Name"
  type = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}
 
variable "vpc_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
}
 
variable "vpc_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
}

variable "vpc_tags" {
  type        = map(any)
}
