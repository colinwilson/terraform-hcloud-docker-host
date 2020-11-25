# Simple Example

This example illustrates how to use the `terraform-hcloud-docker-host` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ssh_public_key | SSH Public Key. | string | n/a | yes |
| ssh_private_key | SSH Private Key. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ipv4_address | IPv4 address of server. |
| volume_size | Size of dedicated Docker data root volume. |
| volume_mount_point | Mount point of dedicated Docker volume. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
