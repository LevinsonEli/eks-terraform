########       GENERAL       ########
variable "bootcamp_tags" {
  type = map(string)
}

variable "naming_prefix" {
  type        = string
  description = "Prefix for resources names to be unique"
}

variable "project_name" {
  type        = string
  description = "Name of current project that will be part of name of each resource"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
