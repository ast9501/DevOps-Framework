resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "devops-system"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.46.7"

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.hosts[0]"
    value = "argocd.myhomelab.com"
  }

  # Set server service type to NodePort
  set {
    name  = "server.service.type"
    value = "NodePort"
  }

  #set {
  #  name = "server.ingress.https"
  #  value = "true"
  #}
}
