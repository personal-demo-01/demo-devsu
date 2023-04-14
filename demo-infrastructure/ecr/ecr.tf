module "ecr" {
  source = "git@github.com:personal-demo-01/demo-terraform-modules.git//ecr?ref=v1.1"
  // source = "../../demo-terraform-modules/ecr"

  ecr_name                 = var.ecr_name
  ecr_image_tag_mutability = var.ecr_image_tag_mutability
  ecr_scan_on_push         = var.ecr_scan_on_push
  ecr_tags                 = var.ecr_tags
}
