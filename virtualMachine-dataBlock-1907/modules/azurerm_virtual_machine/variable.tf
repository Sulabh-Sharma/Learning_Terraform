variable "vms" {
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    nic_name = string
    network_interface_ids = optional(list(string))
    vm_size               = string
    storage_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    storage_os_disk = object({
      name              = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })

    os_profile = object({
      computer_name  = string
      admin_username = string
      admin_password = string
    })

     os_profile_linux_config = object({
      disable_password_authentication = bool
     })
  }))
}
