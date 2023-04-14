# ECR VARIABLES

variable "ecr_name" {
  description = "Ecr name"
  type        = string
}

variable "ecr_image_tag_mutability" {
  description = "Enable tag immutability to prevent image tags from being overwritten"
  type        = string
}

variable "ecr_scan_on_push" {
  description = "Enable scannig in each push action"
  type        = bool
}

variable "ecr_tags" {
  type        = map(any)
}
