# REST API
variable "rest_api_name" {
  type = string
}
variable "rest_api_resource_path_part" {
  type = string
}
variable "rest_api_method_api_key_required" {
  type = bool
}
variable "rest_api_method_http_method" {
  type = string
}
variable "rest_api_integration_type" {
  type = string
}
variable "rest_api_stage_stage_name" {
  type = string
}
variable "data_aws_lb_alb_name" {
  type = string
}

# API KEY
variable "rest_api_usage_plan_name" {
  type = string
}
variable "rest_api_api_key_name" {
  type = string
}
