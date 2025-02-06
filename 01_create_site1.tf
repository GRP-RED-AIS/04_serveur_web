# Boucle pour créer une VM pour chaque entrée dans la variable vm_list
resource "proxmox_vm_qemu" "site1" {
  name       = "site1"
  agent      = 1
  target_node= "SUN"   # Spécifiez le nom de votre nœud Proxmox ici
  clone      = "debian.template"
  scsihw     = "virtio-scsi-pci"
  full_clone   = true
  #system
  vmid       = 11001
  cores      = 2
  memory     = 2048
  cpu        = "host"
  os_type    = "cloud-init"
  tags       = "site1"
  pool = "zone-ruddy"
  #boot option
  bootdisk   = "scsi0"
  
  # Configuration du disque
    #disk
    disks {
      scsi {
      scsi0 {
       disk {
     size = "25G"
     storage = "VM_storage"
     format  = "raw"
            }
       } 
      }
      ide {
        ide2 {
          cloudinit {
            storage = "VM_storage"
          }
        }
      }
    
    }

  # Configuration du réseau

  network {
    model            = "e1000"
    bridge           = "vmbr1"
          }


# Utiliser Cloud-Init pour configurer l'IP et le nom d'hôte unique
  ciuser      = var.ci_user       # Utilisateur configuré via Cloud-Init
  cipassword  = var.ci_mdp      # Mot de passe pour l'utilisateur
  sshkeys     = file(var.ssh_key_pub)  # Ajouter une clé SSH pour accéder aux VMs (optionnel)
  ipconfig0 = "ip=192.168.20.30/24,gw=192.168.20.254"  # Remplacez par votre passerelle réseau 
  nameserver = "1.1.1.2"

  
}























































  
