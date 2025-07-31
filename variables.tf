variable "release_name" {
  default = "demo-nginx"
}

variable "namespace" {
  default = "default"
}

variable "replica_count" {
  default = 2
}

variable "image_repository" {
  default = "nginx"
}

variable "image_tag" {
  default = "alpine"
}

variable "service_type" {
  default = "ClusterIP"
}

variable "ingress_enabled" {
  default = true
}

variable "ingress_host" {
  default = "demo.local"
}

variable "ingress_path" {
  default = "/"
}

variable "ingress_path_type" {
  default = "ImplementationSpecific"
}