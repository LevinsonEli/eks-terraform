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
