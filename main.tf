resource "hcloud_ssh_key" "default" {
  name       = var.ssh_public_key_name
  public_key = var.ssh_public_key
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
  })
}

resource "hcloud_volume" "master" {
  name      = "docker_data_volume"
  size      = var.volume_size
  server_id = hcloud_server.server.id
  automount = true
  format    = var.volume_filesystem

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait --long > /dev/null", # wait for cloud-init process to complete
      "sudo mkfs.${var.volume_filesystem} -F  ${hcloud_volume.master.linux_device}",
      "mkdir /mnt/docker_data_volume",
      "mount -o discard,defaults ${hcloud_volume.master.linux_device} /mnt/docker_data_volume",
      "echo '${hcloud_volume.master.linux_device} /mnt/docker_data_volume ${var.volume_filesystem} discard,nofail,defaults 0 0' >> /etc/fstab"
    ]

    connection {
      host        = hcloud_server.server.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = var.ssh_private_key
    }
  }
}
