resource "aws_ecr_repository" "demo_01_ecr_dev" {
  name                 = var.ecr_name
  image_tag_mutability = var.ecr_image_tag_mutability
  tags                 = var.ecr_tags

  image_scanning_configuration {
    scan_on_push = var.ecr_scan_on_push
  }
}
