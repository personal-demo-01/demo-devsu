locals {
  rest_api_integration_uri = format("http://%s/{proxy}", data.aws_lb.alb.dns_name)
}

module "rest_api" {
  source = "git@github.com:personal-demo-01/demo-terraform-modules.git//rest-api?ref=v1.1"
  // source = "../../demo-terraform-modules/rest-api"

  rest_api_name                    = var.rest_api_name
  rest_api_resource_path_part      = var.rest_api_resource_path_part
  rest_api_method_api_key_required = var.rest_api_method_api_key_required
  rest_api_method_http_method      = var.rest_api_method_http_method
  rest_api_integration_type        = var.rest_api_integration_type
  rest_api_stage_stage_name        = var.rest_api_stage_stage_name
  rest_api_integration_uri         = local.rest_api_integration_uri

  rest_api_usage_plan_name = var.rest_api_usage_plan_name
  rest_api_api_key_name    = var.rest_api_api_key_name
}

data "aws_lb" "alb" {
  name = var.data_aws_lb_alb_name
}
# locals {
#   rest_api_integration_uri = format("http://%s/{proxy}", data.aws_lb.alb.dns_name)
# }

# resource "aws_api_gateway_rest_api" "rest_api" {
#   name = "demo"
# }

# resource "aws_api_gateway_resource" "rest_api_resource" {
#   parent_id   = aws_api_gateway_rest_api.rest_api.root_resource_id
#   path_part   = "{proxy+}"
#   rest_api_id = aws_api_gateway_rest_api.rest_api.id
# }

# resource "aws_api_gateway_method" "rest_api_method" {
#   authorization    = "NONE"
#   api_key_required = true
#   http_method      = "ANY"
#   resource_id      = aws_api_gateway_resource.rest_api_resource.id
#   rest_api_id      = aws_api_gateway_rest_api.rest_api.id

#   request_parameters = {
#     "method.request.path.proxy" = true
#   }
# }

# resource "aws_api_gateway_integration" "rest_api_integration" {
#   http_method             = aws_api_gateway_method.rest_api_method.http_method
#   integration_http_method = aws_api_gateway_method.rest_api_method.http_method
#   resource_id             = aws_api_gateway_resource.rest_api_resource.id
#   rest_api_id             = aws_api_gateway_rest_api.rest_api.id
#   type                    = "HTTP_PROXY"
#   // uri = "http://demo-alb-dev-1884295191.us-east-2.elb.amazonaws.com/{proxy}"
#   uri = local.rest_api_integration_uri
#   request_parameters = {
#     "integration.request.path.proxy" = "method.request.path.proxy"
#   }
# }

# resource "aws_api_gateway_deployment" "rest_api_deployment" {
#   rest_api_id = aws_api_gateway_rest_api.rest_api.id
#   stage_description = "Deployed at ${timestamp()}"

#   triggers = {
#     # The timestamp() function will make this resource be replaced always, 
#     #    to make sure that any change in the api-gateway takes effect.
#     redeployment = sha1(timestamp())
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_api_gateway_stage" "rest_api_stage" {
#   deployment_id = aws_api_gateway_deployment.rest_api_deployment.id
#   rest_api_id   = aws_api_gateway_rest_api.rest_api.id
#   stage_name    = "dev"
# }

# data "aws_lb" "alb" {
#   name = "demo-alb-dev"
# }

# resource "aws_api_gateway_usage_plan" "rest_api_usage_plan" {
#   name = "demo_usage_plan"

#   api_stages {
#     api_id = aws_api_gateway_rest_api.rest_api.id
#     stage  = aws_api_gateway_stage.rest_api_stage.stage_name
#   }
#   quota_settings {
#     limit  = 200000
#     period = "WEEK"
#   }

#   throttle_settings {
#     burst_limit = 500
#     rate_limit  = 1000
#   }
# }

# resource "aws_api_gateway_api_key" "rest_api_api_key" {
#   name = "demo"
# }

# resource "aws_api_gateway_usage_plan_key" "rest_api_usage_play_key" {
#   key_id        = aws_api_gateway_api_key.rest_api_api_key.id
#   key_type      = "API_KEY"
#   usage_plan_id = aws_api_gateway_usage_plan.rest_api_usage_plan.id
# }
