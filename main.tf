resource "hcloud_ssh_key" "default" {
  name       = var.ssh_public_key_name
  public_key = var.ssh_public_key
}

resource "hcloud_volume" "master" {
  name      = "docker_data_volume"
  size      = var.volume_size
  location  = var.server.location
  automount = false
  format    = var.volume_filesystem
}

resource "hcloud_server" "server" {
  name        = var.server.name
  image       = var.server.image
  server_type = var.server.server_type
  location    = var.server.location
  backups     = var.server.backups
  ssh_keys    = [var.ssh_public_key_name]
  user_data   = templatefile("${path.module}/user_data/${var.server.image}.yaml", {
    docker_compose_version = var.docker_compose_version
    volume_filesystem      = var.volume_filesystem
    filesystem_cmd_opt     = var.volume_filesystem == "xfs" ? "-f" : "-F"
    linux_device           = hcloud_volume.master.linux_device
    mount_dir_name         = hcloud_volume.master.name
  })
}

resource "hcloud_volume_attachment" "main" {
  volume_id = hcloud_volume.master.id
  server_id = hcloud_server.server.id
  automount = true
}