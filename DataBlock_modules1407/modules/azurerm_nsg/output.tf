output "nsg_names" {
  value = { for nsg_key, nsg in azurerm_network_security_group.nsg : nsg.name => {
    id                  = nsg.id
    name                = nsg.name
    location            = nsg.location
    resource_group_name = nsg.resource_group_name
    }
  }
}


output "nsg_rule_names" {
  value = { for nsg_rule_key, nsg_rule in azurerm_network_security_rule.nsg_rules : nsg_rule.name => {
    id                           = nsg_rule.id
    name                         = nsg_rule.name
    priority                     = nsg_rule.priority
    direction                    = nsg_rule.direction
    access                       = nsg_rule.access
    protocol                     = nsg_rule.protocol
    source_port_range            = nsg_rule.source_port_range
    destination_port_range       = nsg_rule.destination_port_range
    source_address_prefix        = nsg_rule.source_address_prefix
    destination_address_prefix   = nsg_rule.destination_address_prefix
    resource_group_name          = nsg_rule.resource_group_name
    network_security_group_name  = nsg_rule.network_security_group_name
  } }
}