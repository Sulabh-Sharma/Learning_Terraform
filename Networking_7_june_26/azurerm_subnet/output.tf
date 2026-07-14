output "subnets_details" {
    value = { for subnet_key, subnet in azurerm_subnet.network-subnet :subnet_key => {
        id = subnet.id
        name = subnet.name
        resource_group_name = subnet.resource_group_name
        virtual_network_name = subnet.virtual_network_name
        address_prefixes = subnet.address_prefixes
    }}
}