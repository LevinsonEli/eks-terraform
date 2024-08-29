
resource "helm_release" "argocd" {
  name             = var.argocd_name
  chart            = var.argocd_chart
  repository       = var.argocd_repo
  version          = var.argocd_version
  namespace        = var.argocd_namespace
  create_namespace = true
}
