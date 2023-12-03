resource "helm_release" "gitea" {
  name       = "gitea"
  namespace  = "devops-system"
  repository = "https://dl.gitea.io/charts/"
  chart      = "gitea"
  version    = "8.3.0"

  depends_on = [
    helm_release.longhorn
  ]

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0].host"
    value = "git.alanshomelab.com"
  }

  set {
    name  = "ingress.hosts[0].paths[0].path"
    value = "/"
  }

  set {
    name  = "ingress.hosts[0].paths[0].pathType"
    value = "Prefix"
  }

  set {
    name  = "gitea.admin.password"
    value = "adminadmin"
  }

  set {
    name  = "service.http.type"
    value = "NodePort"
  }

  set {
    name  = "service.http.clusterIP"
    value = ""
  }

  set {
    name  = "service.http.nodePort"
    value = "30180"
  }
}
