output "bastion_details" {
    value = {for bastion_key, bastion in azurerm_bastion_host.bastion :bastion_key => {
        id = bastion.id
        name = bastion.name 
        location = bastion.location
        resource_group_name = bastion.resource_group_name
        ip_configuration = {
            name = bastion.ip_configuration[0].name
            subnet_id = bastion.ip_configuration[0].subnet_id
            public_ip_address_id = bastion.ip_configuration[0].public_ip_address_id
        }
    } }
}   