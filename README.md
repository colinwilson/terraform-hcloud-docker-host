# terraform-hcloud-docker-host
A Terraform module to deploy a single Docker host (in swarm mode) on Hetzner Cloud. A separate Hetzner Cloud volume is also created, attached and configured as the Docker root directory. See the variables file for the available configuration settings.

The resources/services/activations/deletions that this module will create/trigger are:

- Create a server and cloud volume on the Hetzner Cloud Platform
- Create or use an existing SSH Public Key
- Installer Docker Compose, Docker and enable Docker Swarm mode

## Tutorial

https://colinwilson.uk/2020/10/31/provision-a-docker-swarm-host-with-traefik-v2-on-hetzner-cloud-using-terraform-modules-part-1
## Compatibility

This module is meant for use with Terraform 0.13 or higher.

## Usage

Basic usage of this module is as follows:

```hcl
module "hcloud-docker-host" {
  source  = "github.com/colinwilson/terraform-hcloud-docker-host"
  version = "~> 0.1.3"

  server              = = {
    name               = "docker-swarm-host-01"
    server_type        = "cx11"
    image              = "ubuntu-20.04"
    location           = "hel1"
    backups            = false
  }
  ssh_public_key_name = "my_ssh_key"
  ssh_public_key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJNcwP5mhs5/F2T9GFHmg4z6E6sbOG+Ynx2iPERKeOGm"
  volume_size         = 20
  volume_filesystem   = "xfs"

}
```

A Functional example is included in the
[examples](./examples/) directory or clone the **docker-host** branch [here](https://github.com/colinwilson/example-terraform-modules)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

### Required

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ssh_public_key | SSH Public Key. | string | n/a | yes |

### Optional

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| server | Server configuration map. | map(any) | <code lang="hcl">{name = "docker-host", server_type = "cx11", image = "ubuntu-20.04", location = "nbg1", backups = false}</code> | no |
| docker_compose_version | Docker compose version to install. | string | `"1.27.4"` | no |
| volume_size | Volume size (GB) (min 10, max 10240). | number | `10` | no |
| volume_filesystem | Volume filesystem. | string | `"xfs"` | no |
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

A [Hetzner Cloud account](https://accounts.hetzner.com/signUp) and [API Token](https://colinwilson.uk/2020/10/31/generate-an-api-token-in-hetzner-cloud/) (with Read & Write permissions) to provision
the resources of this module.


