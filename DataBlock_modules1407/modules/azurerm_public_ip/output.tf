output "public_ip_details" {
    value = {for pip_key, pip in azurerm_public_ip.pip :pip_key => {
        id = pip.id
        name = pip.name 
        location = pip.location
        resource_group_name = pip.resource_group_name
        allocation_method = pip.allocation_method
    } }
}