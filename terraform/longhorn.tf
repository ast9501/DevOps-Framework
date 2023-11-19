resource "helm_release" "longhorn" {
  name       = "longhorn"
  namespace  = "storage"
  repository = "https://charts.longhorn.io"
  chart      = "longhorn"
  version    = "1.5.1"

  ## Run storage instance on labeled nodes
  ## Add tag to node through web UI: Node>(selected node)>Operation>Edit node and disks.
  #set {
  #  name  = "persistence.defaultNodeSelector.enable"
  #  value = "true"
  #}

  #set {
  #  name  = "persistence.defaultNodeSelector.selector"
  #  value = "storage"
  #}

  # Set replica count to 1 if we have single storage node
  set {
    name  = "persistence.defaultClassReplicaCount"
    value = "3"
  }

  # Set replica count to 1 if we have single node
  set {
    name = "defaultSettings.defaultReplicaCount"
    value = "3"
  }

  set {
    name = "csi.attacherReplicaCount"
    value = "3"
  }

  set {
    name = "csi.provisionerReplicaCount"
    value = "3"
  }

  set {
    name = "csi.resizerReplicaCount"
    value = "3"
  }

  set {
    name = "csi.snapshotterReplicaCount"
    value = "3"
  }
}
