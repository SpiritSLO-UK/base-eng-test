variable "region" {
  description = "The AWS region to deploy to."
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "The environment for the infrastructure"
  type        = string
  default     = "dev"
}
variable "package_type" {
  description = "The package type (Zip or Image) to use for this function."
  type        = string
  default     = "Image"
}

variable "runtime" {
  description = "The identifier of the function's runtime."
  type        = string
  default     = "python3.10"
}

variable "publish" {
  description = "Whether to publish creation/change as new Lambda Function Version."
  type        = bool
  default     = true
}

variable "architectures" {
  description = "A list of Lambda function architectures (ARM64 or x86_64) to build and publish to"
  type        = list(string)
  default     = ["x86_64"]
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds."
  type        = number
  default     = 30
}

variable "function_name" {
  description = "The name of the Lambda Function."
  type        = string
  default = "default_function_name"
}

variable "function_handler" {
  description = "The function entrypoint in your code."
  type        = string
  default     = "main.lambda_handler"
}

variable "powertools_service_name" {
  description = "The name of the service."
  type        = string
  default     = "powertool"
}

variable "log_level" {
  description = "The log level for the function."
  type        = string
  default     = "INFO"
}

variable "filepath" {
  description = "The path to the function's deployment package within the local filesystem."
  type        = string
  default     = "deployment_package.zip" #Need to look into this aftrer AWS infra is sorted
}

variable "ecr_image_tag_mutability" {
  description = "Determines whether image tags can be overwritten"
  type        = string
  default     = "MUTABLE"  // or "IMMUTABLE"
}

variable "ecr_repository_url" {
  description = "The URL of the ECR repository."
  type        = string
  default = "880653920649.dkr.ecr.eu-west-1.amazonaws.com/ecr_powertool_dev"
}
