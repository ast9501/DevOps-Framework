resource "kubernetes_namespace_v1" "metallb_ns" {
  metadata {
    annotations = {
      name = "metallb-system"
    }

    #labels = {
    #  mylabel = "label-value"
    #}

    name = "metallb-system"
  }
}

resource "kubernetes_namespace_v1" "traefik_ns" {
  metadata {
    annotations = {
      name = "traefik"
    }

    #labels = {
    #  mylabel = "label-value"
    #}

    name = "traefik"
  }
}
