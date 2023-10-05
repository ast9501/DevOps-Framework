resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = "devops-system"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "4.6.5"

  set {
    name  = "persistence.storageClass"
    value = "nfs-client"
  }

  set {
    name  = "controller.ingress.enabled"
    value = "true"
  }

  set {
    name  = "controller.ingress.hosts[0].host"
    value = "git.myhomelab.com"
  }

  set {
    name  = "controller.ingress.path"
    value = "/"
  }

  set {
    name  = "controller.ingress.hostName"
    value = "jenkins.myhomelab.com"
  }

  #set {
  #  name = "persistence.storageClass"
  #  value = "nfs-client"
  #}
}
