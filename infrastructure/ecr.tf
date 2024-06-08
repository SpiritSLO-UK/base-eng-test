resource "aws_ecr_repository" "ecr" {
    name = "ECR_${var.powertools_service_name}_${var.environment}"
    image_tag_mutability = var.ecr_image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }
}
