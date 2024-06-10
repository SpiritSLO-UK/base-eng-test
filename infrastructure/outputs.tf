output "api_gateway_url" {
    value = aws_apigatewayv2_api.event_handler.api_endpoint
    description = "URL of the API Gateway"
}
