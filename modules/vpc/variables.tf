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

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}
