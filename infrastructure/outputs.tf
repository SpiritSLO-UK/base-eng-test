output "ecr_repository_name" {
  description = "The name of the ECR repository"
  value       = aws_ecr_repository.ecr.name
}

output "api_gateway_url" {
    value = aws_apigatewayv2_api.event_handler.api_endpoint
    description = "URL of the API Gateway"
}