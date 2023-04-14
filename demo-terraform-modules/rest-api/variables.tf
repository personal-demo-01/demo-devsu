# REST API
variable "rest_api_name" {
  type = string
}
variable "rest_api_resource_path_part" {
  type = string
}
variable "rest_api_method_authorization" {
  type    = string
  default = "NONE"
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
variable "rest_api_integration_uri" {
  type = string
}
variable "rest_api_stage_stage_name" {
  type = string
}


# API KEY
variable "rest_api_usage_plan_name" {
  type = string
}
variable "rest_api_usage_plan_quota_settings_limit" {
  type    = number
  default = 200000
}
variable "rest_api_usage_plan_quota_settings_period" {
  type    = string
  default = "WEEK"
}
variable "rest_api_usage_plan_throttle_settings_burst_limit" {
  type    = number
  default = 500
}
variable "rest_api_usage_plan_throttle_settings_rate_limit" {
  type    = number
  default = 1000
}
variable "rest_api_api_key_name" {
  type = string
}
variable "rest_api_usage_play_key_key_type" {
  type    = string
  default = "API_KEY"
}
