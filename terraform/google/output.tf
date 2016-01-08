output "rancher-server" {
    value = "Go to ${google_compute_instance.hyperion-master.network_interface.0.access_config.0.nat_ip}:8080"
}
