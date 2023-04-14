resource "aws_api_gateway_rest_api" "rest_api" {
  name = var.rest_api_name
}

resource "aws_api_gateway_resource" "rest_api_resource" {
  parent_id   = aws_api_gateway_rest_api.rest_api.root_resource_id
  path_part   = var.rest_api_resource_path_part
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
}

resource "aws_api_gateway_method" "rest_api_method" {
  authorization    = var.rest_api_method_authorization
  api_key_required = var.rest_api_method_api_key_required
  http_method      = var.rest_api_method_http_method
  resource_id      = aws_api_gateway_resource.rest_api_resource.id
  rest_api_id      = aws_api_gateway_rest_api.rest_api.id

  request_parameters = {
    "method.request.path.proxy" = true
  }
}

resource "aws_api_gateway_integration" "rest_api_integration" {
  http_method             = aws_api_gateway_method.rest_api_method.http_method
  integration_http_method = aws_api_gateway_method.rest_api_method.http_method
  resource_id             = aws_api_gateway_resource.rest_api_resource.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api.id
  type                    = var.rest_api_integration_type
  uri                     = var.rest_api_integration_uri
  request_parameters = {
    "integration.request.path.proxy" = "method.request.path.proxy"
  }
}

resource "aws_api_gateway_deployment" "rest_api_deployment" {
  rest_api_id       = aws_api_gateway_rest_api.rest_api.id
  stage_description = "Deployed at ${timestamp()}"

  triggers = {
    # The timestamp() function will make this resource be replaced always, 
    #    to make sure that any change in the api-gateway takes effect.
    redeployment = sha1(timestamp())
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "rest_api_stage" {
  deployment_id = aws_api_gateway_deployment.rest_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  stage_name    = var.rest_api_stage_stage_name

}

