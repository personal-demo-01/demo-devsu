# ECR VARIABLES

variable "ecr_name" {
  type    = string
}

variable "ecr_image_tag_mutability" {
  type    = string
}

variable "ecr_scan_on_push" {
  type    = bool
}

variable "ecr_tags" {
  type = map(any)
}
