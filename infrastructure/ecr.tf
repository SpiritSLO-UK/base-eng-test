/**
 * AWS ECR Repository
 *
 * This resource creates an AWS Elastic Container Registry (ECR) repository.
 * The repository name is dynamically generated based on the `powertools_service_name` and `environment` variables.
 * The `image_tag_mutability` variable determines whether the image tags can be overwritten or not.
 * Image scanning is enabled, which means that images will be scanned for vulnerabilities when pushed to the repository.
 *
 */

resource "aws_ecr_repository" "ecr" {
    name = "ecr_${var.powertools_service_name}_${var.environment}"
    image_tag_mutability = var.ecr_image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }
}

/**
 * AWS ECR Lifecycle Policy
 *
 * This resource creates a lifecycle policy for the AWS Elastic Container Registry (ECR) repository.
 * The policy ensures that there are no more than 10 images available in the repository.
 * If there are more than 10 images, the oldest images will be expired.
 *
 */

resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
  repository = aws_ecr_repository.ecr.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Ensures there are no more than 10 images available",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": ${var.image_count}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

output "ecr_repository_name" {
  description = "The name of the ECR repository"
  value       = aws_ecr_repository.ecr.name
}
