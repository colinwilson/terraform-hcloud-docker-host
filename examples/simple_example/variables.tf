variable "ssh_public_key_name" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}
variable "server" {}
variable "volume_size" {}
variable "volume_filesystem" {}
variable "hcloud_token" {}


ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJNcwP5mhs5/F2T9GFHmg4z6E6sbOG+Ynx2iPERKeOGm"

ssh_private_key = "-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW\nQyNTUxOQAAACCTXMD+ZobOfxdk/RhR5oOM+hOrGzhvmJ8dojxESnjhpgAAAKAT7qvkE+6r\n5AAAAAtzc2gtZWQyNTUxOQAAACCTXMD+ZobOfxdk/RhR5oOM+hOrGzhvmJ8dojxESnjhpg\nAAAEA3uuisz1EbVpmyvAkAdhF29CCKN0oR9+fdGVcDkF8YBZNcwP5mhs5/F2T9GFHmg4z6\nE6sbOG+Ynx2iPERKeOGmAAAAG2NvbGlud2lsc29uQERFU0tUT1AtMUZUQUo3TwEC\n-----END OPENSSH PRIVATE KEY-----"

ssh_public_key_name = "public_ssh_key.pub"

hcloud_token = "l113WfwCFwZCbVcxVsQHHuMAJINQV6K8hhyVjzOMymotxb2z1oBh6ANwheFvV2lF"