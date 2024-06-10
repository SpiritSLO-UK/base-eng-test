output "api_gateway_url" {
  value       = aws_apigatewayv2_api.event_handler.api_endpoint
  description = "URL of the API Gateway"
}

output "ecr_repository_url" {
    value = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/ecr_${var.powertools_service_name}_${var.environment}"
    description = "URL of the ECR repository"
}
