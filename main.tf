resource "helm_release" "demo_nginx" {
  name       = var.release_name
  namespace  = var.namespace
  chart      = "${path.module}/charts/demo-chart"

  set {
    name  = "replicaCount"
    value = var.replica_count
  }

  set {
    name  = "image.repository"
    value = var.image_repository
  }

  set {
    name  = "image.tag"
    value = var.image_tag
  }

  set {
    name  = "service.type"
    value = var.service_type
  }

  set {
    name  = "ingress.enabled"
    value = var.ingress_enabled
  }

  set {
    name  = "ingress.hosts[0].host"
    value = var.ingress_host
  }

  set {
    name  = "ingress.hosts[0].paths[0].path"
    value = var.ingress_path
  }

  set {
    name  = "ingress.hosts[0].paths[0].pathType"
    value = var.ingress_path_type
  }
}