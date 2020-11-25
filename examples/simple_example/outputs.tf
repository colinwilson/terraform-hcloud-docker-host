output "server_ip" {
  description = "Public IPv4 Address of the Docker host"
  value = module.hcloud-docker-host.ipv4_address
}

output "volume_size" {
  description = "Size of the provsioned Heztner Cloud Volume"
  value = module.hcloud-docker-host.volume_size
}

output "volume_mount_point" {
  description = "Mountpoint of the provsioned Heztner Cloud Volume"
  value = module.hcloud-docker-host.volume_mount_point
}