resource "aws_ecr_repository" "ecr" {
    name = "ecr_${var.powertools_service_name}_${var.environment}"
    image_tag_mutability = var.ecr_image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_location" {
    value = aws_ecr_repository.ecr.repository_url
}
