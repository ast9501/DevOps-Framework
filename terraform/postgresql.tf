resource "helm_release" "postgresql" {
  name       = "postgresql"
  namespace  = "homelab"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "13.4.2"

  depends_on = [
    helm_release.longhorn
  ]

  set {
    name  = "global.postgresql.auth.username"
    value = "admin"
  }

  set {
    name  = "global.postgresql.auth.password"
    value = "adminadmin0415"
  }

  set {
    name  = "auth.postgresPassword"
    value = "postgresadmin0415"
  }

  set {
    name  = "primary.service.type"
    value = "NodePort"
  }

  set {
    name  = "primary.service.nodePorts.postgresql"
    value = "30432"
  }

  set {
    name = "primary.persistence.size"
    value = "10Gi"
  }

}
