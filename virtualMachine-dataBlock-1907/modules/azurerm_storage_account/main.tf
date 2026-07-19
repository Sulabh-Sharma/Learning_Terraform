resource "azurerm_storage_account" "dev-storageAcc" {
  for_each                 = var.storageAcc
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  tags = {
    environment = each.value.tags.environment
  }
}

resource "azurerm_storage_container" "sta-container" {
  depends_on = [ azurerm_storage_account.dev-storageAcc]
  for_each              = var.storageAcc
  name                  = each.value.container_name
  storage_account_id    = data.azurerm_storage_account.storagedata[each.key].id
  container_access_type = each.value.container_access_type
}
