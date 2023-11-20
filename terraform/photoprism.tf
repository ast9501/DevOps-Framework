resource "helm_release" "photoprism" {
  name       = "photoprism"
  namespace  = "life"
  repository = "https://djjudas21.github.io/charts/"
  chart      = "photoprism"
  version    = "7.4.8"

  depends_on = [
    helm_release.longhorn
  ]

  set {
    name  = "env.TZ"
    value = "Asia/Taipei"
  }

  set {
    name  = "env.PHOTOPRISM_ADMIN_PASSWORD"
    value = "photoadmin"
  }

  set {
    name  = "env.PHOTOPRISM_DATABASE_DRIVER"
    value = "mysql"
  }

  #set {
  #  name  = "persistence.config.enabled"
  #  value = "true"
  #}

  set {
    name  = "persistence.originals.enabled"
    value = "true"
  }

  set {
    name  = "persistence.originals.mountPath"
    value = "/photoprism/originals"
  }

  set {
    name = "persistence.originals.accessMode"
    value = "ReadWriteOnce"
  }

  set {
    name = "persistence.originals.size"
    value = "20Gi"
  }

  set {
    name  = "mariadb.enabled"
    value = "true"
  }

  set {
    name  = "mariadb.primary.persistence.enabled"
    value = "true"
  }

}
