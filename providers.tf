terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.15.0"
    }
  }
  required_version = ">= 1.9.2"

  backend "s3" {
    bucket = "eliyahu-cluster-tf-state"
    key    = "cluster.state"
    region = "us-east-1"
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
