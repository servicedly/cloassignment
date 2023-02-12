# Instance type
variable "instance_type" {
  default = {
    "prod"    = "t3.medium"
    "test"    = "t3.micro"
    "staging" = "t2.micro"
    "dev"     = "t2.micro"
  }
  description = "Type of the instance"
  type        = map(string)
}

# Variable to signal the current environment 
variable "env" {
  default     = "dev"
  type        = string
  description = "Deployment Environment"
}
variable "encrypt_type" {
  description = "Provide type of encryption here"
  type        = string
  default     = "KMS"
}
variable "image_mutability" {
  description = "Provide image mutability"
  type        = string
  default     = "IMMUTABLE"
}
variable "ecr_name" {
  description = "The name of the ECR registry"
  type        = string
  default     = "manish"
}


