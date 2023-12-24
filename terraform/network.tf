resource "helm_release" "metal_lb" {
  name       = "metallb-loadbalancer"
  namespace  = "metallb-system"
  repository = "https://metallb.github.io/metallb"
  chart      = "metallb"
  version    = "v0.13.10"

  #set {
  #  name = ""
  #  value = ""
  #  type = ""
  #}
}

resource "helm_release" "traefik" {
  name       = "traefik"
  namespace  = "traefik"
  repository = "https://traefik.github.io/charts"
  chart      = "traefik"
  version    = "v24.0.0"

  depends_on = [
    helm_release.metal_lb
  ]

  set {
    name = "ports.gitea-ssh.port"
    value = "30122"
  }
  set {
    name = "ports.gitea-ssh.expose"
    value = "true"
  }

  set {
    name = "volumes[0].name"
    value = "tls-secret"
  }

  set {
    name = "volumes[0].mountPath"
    value = "/certs"
  }

  set {
    name = "volumes[0].type"
    value = "secret"
  }

  set {
    name = "volumes[1].name"
    value = "traefik-config"
  }

  set {
    name = "volumes[1].mountPath"
    value = "/config"
  }

  set {
    name = "volumes[1].type"
    value = "configMap"
  }

  set {
    name = "ports.websecure.tls.domains[0].main"
    value = "alanshomelab.com"
  }

  set {
    name = "ports.websecure.tls.domains[0].sans[0]"
    value = "alanshomelab.com"
  }

  set {
    name = "ports.websecure.tls.domains[0].sans[1]"
    value = "*.alanshomelab.com"
  }

  set {
    name = "additionalArguments[0]"
    value = "--providers.file.filename=/config/dyn.yaml"
  }
}
