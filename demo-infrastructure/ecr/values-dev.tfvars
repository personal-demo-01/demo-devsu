ecr_name                 = "demo-api"
ecr_image_tag_mutability = "MUTABLE"
ecr_scan_on_push         = false
ecr_tags = {
  Environment   = "dev",
  Resource-Name = "demo-api"
}
