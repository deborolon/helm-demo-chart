output "release_name" {
    value = helm_release.demo_nginx.name
}

output "ingress_host" {
    value = var.ingress_host
}