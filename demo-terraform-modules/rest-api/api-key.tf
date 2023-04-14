resource "aws_api_gateway_usage_plan" "rest_api_usage_plan" {
  name = var.rest_api_usage_plan_name

  api_stages {
    api_id = aws_api_gateway_rest_api.rest_api.id
    stage  = aws_api_gateway_stage.rest_api_stage.stage_name
  }
  quota_settings {
    limit  = var.rest_api_usage_plan_quota_settings_limit
    period = var.rest_api_usage_plan_quota_settings_period
  }

  throttle_settings {
    burst_limit = var.rest_api_usage_plan_throttle_settings_burst_limit
    rate_limit  = var.rest_api_usage_plan_throttle_settings_rate_limit
  }
}

resource "aws_api_gateway_api_key" "rest_api_api_key" {
  name = var.rest_api_api_key_name
}

resource "aws_api_gateway_usage_plan_key" "rest_api_usage_play_key" {
  key_id        = aws_api_gateway_api_key.rest_api_api_key.id
  key_type      = var.rest_api_usage_play_key_key_type
  usage_plan_id = aws_api_gateway_usage_plan.rest_api_usage_plan.id
}
