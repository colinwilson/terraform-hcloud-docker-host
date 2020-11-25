# terraform-hcloud-docker-host
An Terraform module to deploy a single Docker host (in swarm mode) on Hetzner Cloud. A separate Hetzner Cloud volume is created and attached to the host as storage for Docker volumes See the variables file for the available configuration settings.

The resources/services/activations/deletions that this module will create/trigger are:

- Create a server on the Hetzner Cloud Platform
- Create or use an existing SSH Key pair
- Installer Docker Compose, Docker and enable Docker Swarm mode

## Compatibility

This module is meant for use with Terraform 0.13 or higher.

## Usage

Basic usage of this module is as follows:

```hcl
module "hcloud-docker-host" {
  source  = "github.com/colinwilson/terraform-hcloud-docker-host"
  version = "~> 0.1.2"

  server              = = {
    name               = "docker-swarm-host-01"
    server_type        = "cx11"
    image              = "ubuntu-20.04"
    location           = "hel1"
    backups            = false
  }
  ssh_public_key_name = "my_ssh_key"
  ssh_public_key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJNcwP5mhs5/F2T9GFHmg4z6E6sbOG+Ynx2iPERKeOGm"
  ssh_private_key     = "-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW\nQyNTUxOQAAACCTXMD+ZobOfxdk/RhR5oOM+hOrGzhvmJ8dojxESnjhpgAAAKAT7qvkE+6r\n5AAAAAtzc2gtZWQyNTUxOQAAACCTXMD+ZobOfxdk/RhR5oOM+hOrGzhvmJ8dojxESnjhpg\nAAAEA3uuisz1EbVpmyvAkAdhF29CCKN0oR9+fdGVcDkF8YBZNcwP5mhs5/F2T9GFHmg4z6\nE6sbOG+Ynx2iPERKeOGmAAAAG2NvbGlud2lsc29uQERFU0tUT1AtMUZUQUo3TwEC\n-----END OPENSSH PRIVATE KEY-----"
  volume_size         = 20
  volume_filesystem   = "xfs"

}
```

A Functional example is included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

### Required

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ssh_public_key | SSH Public Key. | string | n/a | yes |
| ssh_private_key | SSH Private Key. | string | n/a | yes |

### Optional

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| server | Server configuration map. | map(any) | <code lang="hcl">{name = "docker-host", server_type = "cx11", image = "ubuntu-20.04", location = "nbg1", backups = false}</code> | no |
| docker_compose_version | Docker compose version to install. | string | `"1.27.4"` | no |
| volume_size | Volume size (GB) (min 10, max 10240). | number | `10` | no |
| volume_filesystem | Volume filesystem. | string | `"ext4"` | no |
| ssh_public_key_name | SSH Public Key Name. | string | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| ipv4_address | IPv4 address of server. |
| volume_size | Size of dedicated Docker data root volume. |
| volume_mount_point | Mount point of dedicated Docker volume. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform](https://www.terraform.io/downloads.html) v0.13
- [Terraform Provider for Hetzner Cloud](https://registry.terraform.io/providers/hetznercloud/hcloud/latest) version v1.2.x

### Hetzner Cloud Account

A [Hetzner Cloud account](https://accounts.hetzner.com/signUp) with an API Token (with Read & Write permissions) to provision
the resources of this module.


