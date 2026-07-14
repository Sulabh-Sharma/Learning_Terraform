resource "azurerm_resource_group" "rg" {
  for_each = var.lb
  name     = each.value.resource_group_name
  location = each.value.location
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.lb
  name                = each.value.public_ip_name
  location            = azurerm_resource_group.rg[each.key].location
  resource_group_name = azurerm_resource_group.rg[each.key].name
  allocation_method   = each.value.allocation_method

}



resource "azurerm_lb" "aloadBalancer" {
  for_each            = var.lb
  name                = each.value.lb_name
  location            = azurerm_resource_group.rg[each.key].location
  resource_group_name = azurerm_resource_group.rg[each.key].name
  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}
