resource "azurerm_virtual_network" "vnet-networking" {
  for_each            = var.vnetworks
  name                = each.value.name
  address_space       = each.value.address_space
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}
