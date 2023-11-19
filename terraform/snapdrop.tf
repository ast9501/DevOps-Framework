resource "helm_release" "snapdrop" {
  name       = "snapdrop"
  namespace  = "homelab"
  repository = "https://charts.pascaliske.dev"
  chart      = "snapdrop"
  version    = "2.0.0"

  set {
    name  = "service.type"
    value = "NodePort"
  }
  set {
    name = "env[0].name"
    value = "TZ"
  }
  set {
    name  = "env[0].value"
    value = "UTC+8"
  }
}
