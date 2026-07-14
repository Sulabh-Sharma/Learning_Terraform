output "nic_details" {
    value = {for nic_key, nic in azurerm_network_interface.nic :nic_key => {
        id = nic.id
        name = nic.name 
        location = nic.location
        resource_group_name = nic.resource_group_name
        ip_configuration = {
            name = nic.ip_configuration[0].name
            subnet_id = nic.ip_configuration[0].subnet_id
        }
    } }
}