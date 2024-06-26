# I setup state file to be pushed to Terraform Cloud
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Base-Blaz-Test"

    workspaces {
      name = "base-eng-test"
    }
  }
}

locals {
  ecr_repository_url = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/ecr_${var.powertools_service_name}_${var.environment}"
}

resource "aws_lambda_function" "event_handler" {
  # checkov:skip=CKV_AWS_117: We have no other resources in VPC to be accessed by this Lambda function
  # checkov:skip=CKV_AWS_116: For this application we do not requiere DLQ capability
  # checkov:skip=CKV_AWS_272: We are using docker image as a package type
  # checkov:skip=CKV_AWS_50: We do not need to enable X-Ray tracing for this Lambda function
  # checkov:skip=CKV_AWS_173: We do not need to enable encryption at rest for this Lambda function
  function_name                  = "${var.function_name}_${var.environment}"
  role                           = aws_iam_role.event_handler_execution_role.arn
  package_type                   = var.package_type
  image_uri                      = "${local.ecr_repository_url}:${var.image_tag}"
  publish                        = var.publish
  architectures                  = var.architectures
  reserved_concurrent_executions = var.reserved_concurrent_executions

  timeout = var.timeout

  environment {
    variables = {
      POWERTOOLS_SERVICE_NAME = var.powertools_service_name
      LOG_LEVEL               = var.log_level
    }
  }
}

resource "aws_cloudwatch_log_group" "event_handler" {
  # checkov:skip=CKV_AWS_338: No need to keep logs for this test for long duration
  # checkov:skip=CKV_AWS_158: As this is not a production environment, we can skip this check
  name              = "/aws/lambda/${var.function_name}_${var.environment}"
  retention_in_days = 60
}
