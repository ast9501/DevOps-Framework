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

  #set {
  #
  #}
}
