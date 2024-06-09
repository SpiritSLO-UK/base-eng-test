variable "account_id" {
  description = "The AWS account ID."
  type        = string
  default     = "880653920649"
}

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
  default = "Hal_9000"
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

variable "ecr_image_tag_mutability" {
  description = "Determines whether image tags can be overwritten"
  type        = string
  default     = "MUTABLE"  // or "IMMUTABLE"
}

variable "image_count" {
  description = "The number of untagged images to retain in the ECR repository"
  type        = number
  default     = 10
}
