output "api_gateway_url" {
  value       = aws_apigatewayv2_api.event_handler.api_endpoint
  description = "URL of the API Gateway"
}

output "ecr_repository_url" {
    value = local.ecr_repository_url
    description = "URL of the ECR repository"
}
