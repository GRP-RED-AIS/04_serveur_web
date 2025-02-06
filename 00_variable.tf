# Ip server
variable "ssh_host_site1" {}
variable "ssh_host_site2" {}
variable "ssh_host_site3" {}
variable "ssh_host_site4" {}
variable "ssh_host_site5" {}

#ssh user
variable "ssh_user" {}
variable "ssh_key" {}
variable "ssh_key_pub" {}

#cloud-init
variable "ci_user" {}
variable "ci_mdp" {}




# Déclaration des variables
variable "proxmox_api_token_id" {
  description = "ID du token API Proxmox"
  type        = string
}

variable "proxmox_api_token_secret" {
  description = "Secret du token API Proxmox"
  type        = string
  sensitive   = true  # Masque la valeur dans les logs Terraform
}
