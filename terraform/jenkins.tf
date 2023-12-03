resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = "devops-system"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "4.6.5"

  depends_on = [
    helm_release.longhorn
  ]

  set {
    name  = "controller.ingress.enabled"
    value = "true"
  }

  set {
    name  = "controller.ingress.path"
    value = "/"
  }

  set {
    name  = "controller.ingress.hostName"
    value = "jenkins.alanshomelab.com"
  }

}
