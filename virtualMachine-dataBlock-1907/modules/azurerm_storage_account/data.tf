data "azurerm_storage_account" "storagedata" {
  for_each           = var.storageAcc
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}