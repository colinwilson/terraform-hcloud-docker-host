output "ipv4_address" {
  description = "Server Public IPv4 address"
  value = hcloud_server.server.ipv4_address
}

output "volume_size" {
  description = "Size of provisioned Cloud Volume"
  value = hcloud_volume.master.size
}

output "volume_mount_point" {
  description = "Mountpoint of provisioned Cloud Volume"
  value = hcloud_volume.master.linux_device
}