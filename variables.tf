
########       EKS       ########
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

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type for the worker nodes"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

########       ARGO       ########
variable "argocd_version" {
  description = "ArcgoCD helm chart version"
  type        = string
}

variable "argocd_name" {
  description = "ArcgoCD deployment name"
  type        = string
}

variable "argocd_chart" {
  description = "ArcgoCD chart name to pull"
  type        = string
}

variable "argocd_repo" {
  description = "ArcgoCD git repository URL"
  type        = string
}

variable "argocd_namespace" {
  description = "Kubernetes namespace of ArcgoCD"
  type        = string
}

########       GENERAL       ########
variable "bootcamp_tags" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "naming_prefix" {
  type        = string
  description = "Prefix for resources names to be unique"
}

variable "project_name" {
  type        = string
  description = "Name of current project that will be part of name of each resource"
}
